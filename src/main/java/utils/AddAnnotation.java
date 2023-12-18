package utils;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class AddAnnotation {
    public static void main(String[] args) {
        // String txtPath = "C:\\Users\\夏和圆周\\Desktop\\Dprojectvscodealinesnoalinesno-infr.txt";
        // try {
        //     List<String> folderPaths = readJavaFile(txtPath);

        //     for (int i = 0; i < folderPaths.size(); i++) {
        //         String folderPath = folderPaths.get(i);
        //         System.out.println("--------------现在正在服务：" + folderPath);
        //         checkFolder(folderPath);
        //         System.out.println("-------------------------------服务添加注解成功：" + folderPath);
        //         Thread.sleep(3000);
        //     }
        // } catch (Exception e) {
        //     // TODO Auto-generated catch block
        //     e.printStackTrace();
        // }
        checkFolder("");

    }

    public static void checkFolder(String folderPath) {
        folderPath =
        "D:\\project\\vscode\\alinesno\\alinesno-infra-data-stream\\alinesno-infra-data-stream-facade\\src\\main\\java\\com\\alinesno\\infra\\data\\flink\\entity";
        File folder = new File(folderPath);

        File[] files = folder.listFiles();

        for (int i = 0; i < files.length; i++) {
            String filePath = files[i].getAbsolutePath();
            System.out.println(">>>>>>>>>>>>正在修改的文件：" + i + ". " + files[i].getName());
            try {
                addAnnotation(filePath);
            } catch (Exception e) {
                System.out.println("_____________________________当前报错文件序号：" + i + ". " + files[i].getName());
                e.printStackTrace();
            }

        }
    }

    private static void addAnnotation(String filePath) {
        try {
            // 读取Java文件内容
            List<String> entityCode = readJavaFile(filePath);

            // 保存变量名和行数
            List<Integer> varLine = new ArrayList<>();
            List<String> varName = new ArrayList<>();
            saveVariableInfo(entityCode, varLine, varName);

            // 创建新的变量名列表和注释列表
            List<String> tableFieldName = new ArrayList<>();
            List<String> columnCommentName = new ArrayList<>();
            List<String> typeLength = new ArrayList<>();
            convertVariableNames(varName, tableFieldName);
            convertVariableComments(varName, columnCommentName, entityCode, varLine);
            convertVariableTypes(varName, typeLength);

            // 修改Java文件内容
            modifyJavaFile(entityCode, varLine, tableFieldName, columnCommentName, varName, typeLength);

            // 将修改后的内容覆盖原文件
            writeJavaFile(filePath, entityCode);

            System.out.println("文件修改完成！");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static List<String> readJavaFile(String filePath) throws IOException {
        // 使用Java 11的新特性读取文件内容到字符串列表
        Path path = Paths.get(filePath);
        return Files.readAllLines(path);
    }

    private static void saveVariableInfo(List<String> entityCode, List<Integer> varLine, List<String> varName) {
        for (int i = 0; i < entityCode.size(); i++) {
            String line = entityCode.get(i).trim();
            if (line.startsWith("private") && line.contains(" ")) {
                int lineNum = i + 1; // 行数从1开始计数
                String[] tokens = line.split(" "); // 按空格分割行
                if (tokens.length >= 3) {
                    String variableType = tokens[1]; // 变量类型在第二个位置
                    String variableName = tokens[2].substring(0, tokens[2].length() - 1); // 变量名在第三个位置
                    varLine.add(lineNum);
                    varName.add(variableName);
                }
            }
        }
    }

    private static void convertVariableNames(List<String> varName, List<String> tableFieldName) {
        for (String variableName : varName) {
            StringBuilder convertedName = new StringBuilder();
            for (int j = 0; j < variableName.length(); j++) {
                char c = variableName.charAt(j);
                if (Character.isUpperCase(c)) {
                    convertedName.append('_').append(Character.toLowerCase(c));
                } else {
                    convertedName.append(c);
                }
            }
            tableFieldName.add(convertedName.toString());
        }
    }

    private static void convertVariableComments(List<String> varName, List<String> columnCommentName,
            List<String> entityCode, List<Integer> varLine) {
        for (int i = 0; i < varName.size(); i++) {
            String variableName = varName.get(i);
            Integer variableLine = varLine.get(i);

            // 获取注释
            String convertedComment = getTheContent(entityCode, variableLine);

            // 使用百度翻译
            // if (convertedComment == null) {
            // convertedComment = textTranslate.translateText(variableName, "en", "zh"); //
            // 根据变量名转换成中文注释的逻辑实现
            // }
            // String converted = convertedComment.indexOf(convertedComment.length() - 1) ==
            // '，'
            // ? convertedComment.substring(0, convertedComment.length() - 1)
            // : convertedComment;

            // 使用gpt获取翻译
            if (convertedComment == null) {
                // 构建提问请求内容
                String question = String.format("请就名为%s的数据库字段，返回一个合适的中文注释，若无法确定则返回原数据库字段名，返回格式：数据库字段%s的中文解释为:::<解释>",
                        variableName,
                        variableName);

                convertedComment = ChatUtil.sendChatOk(question);
            }
            if (convertedComment.equals("255") || convertedComment.contains("无法确定"))
                convertedComment = variableName;

            columnCommentName.add(convertedComment);
        }
    }

    private static void convertVariableTypes(List<String> varName, List<String> typeLength) {
        // 遍历varName数组，调用chatgpt接口发送提问请求并将返回内容保存到typeLength数组中
        for (int i = 0; i < varName.size(); i++) {
            String variableName = varName.get(i);

            // 构建提问请求内容
            String question = String.format("根据数据库字段名%s，给出一个合适的字段长度值，返回格式：数据库字段%s的合适长度值为:::<长度>", variableName,
                    variableName);

            // 发送提问请求，并将返回内容保存到typeLength数组中
            String length = ChatUtil.sendChatOk(question);
            typeLength.add(length);
        }
    }

    public static Boolean checkTheContent(List<String> entityCode, int lineNum, String endContent,
            String checkContent) {
        int i = lineNum - 2;
        while (i > 0) {
            String line = entityCode.get(i).trim();
            if (line.contains(checkContent))
                return true;
            if (line.contains(endContent))
                break;
            if (line.contains("private"))
                break;
            i--;
        }

        return false;
    }

    public static String getTheContent(List<String> entityCode, int lineNum) {
        String endContent = "";
        String getContent = "/**";
        int i = lineNum - 2;
        while (i > 0) {
            String line = entityCode.get(i).trim();
            if (line.contains("private") || line.contains("public class"))
                break;
            if (line.contains(getContent)) {
                String line2 = entityCode.get(i + 1).trim();
                String[] tokens = line2.split(" ");
                if (tokens.length >= 1) {
                    return tokens[1];
                }
            } else if (line.contains("//")) {
                String line2 = entityCode.get(i).trim();
                String[] tokens = line2.split(" ");
                if (tokens.length >= 1) {
                    return tokens[1];
                }
            }

            i--;
        }

        return null;
    }

    private static void modifyJavaFile(List<String> entityCode, List<Integer> varLine, List<String> tableFieldName,
            List<String> columnCommentName, List<String> varName, List<String> typeLength) {

        // 删除最后一个变量后的内容
        int endIndex = varLine.get(varLine.size() - 1);
        if (endIndex < entityCode.size() - 1) {
            entityCode.subList(endIndex, entityCode.size() - 1).clear();
        }

        // 修改Java文件内容
        for (int i = varLine.size() - 1; i >= 0; i--) {
            int lineNum = varLine.get(i);
            String variableName = varName.get(i);
            String tableFieldNameStr = tableFieldName.get(i);
            String columnCommentNameStr = columnCommentName.get(i);
            String typeLengthStr = typeLength.get(i);
            if (typeLengthStr == null)
                typeLengthStr = "255";
            if (typeLengthStr.equals("null"))
                typeLengthStr = "255";
            if (typeLengthStr.contains("具体需求"))
                typeLengthStr = "255";
            if (typeLengthStr.length() >= 6)
                typeLengthStr = "255";
            if (typeLengthStr.contains("<长度>") || typeLengthStr.contains("无法确定"))
                typeLengthStr = "255";

            // 检查是否包含特定注解
            String endContent = "*/";
            Boolean tableFieldFlag = checkTheContent(entityCode, lineNum, endContent, "@TableField");
            Boolean columnCommentFlag = checkTheContent(entityCode, lineNum, endContent, "@ColumnComment");
            Boolean columnType = checkTheContent(entityCode, lineNum, endContent, "@ColumnType");

            // 如果没有包含特定注解则插入
            if (!tableFieldFlag) {
                String insertContent = String.format("\t@TableField(\"%s\")", tableFieldNameStr);
                entityCode.add(lineNum - 1, insertContent);
            }
            if (!columnCommentFlag) {
                String insertContent = String.format("\t@ColumnComment(\"%s\")", columnCommentNameStr);
                entityCode.add(lineNum - 1, insertContent);
            }
            if (!columnType) {
                String insertContent = String.format("\t@ColumnType(length=%s)", typeLengthStr);
                entityCode.add(lineNum - 1, insertContent);
            }

        }

        // 添加 @Data 注解
        int classNameLine = 0; // 类名所在的行号
        for (int i = 0; i < entityCode.size(); i++) {
            String line = entityCode.get(i).trim();
            if (line.startsWith("public class")) {
                classNameLine = i;
                break;
            }
        }
        String endContent = "*/";
        String checkContent = "Data";
        Boolean dataFlag = checkTheContent(entityCode, classNameLine + 1, endContent, checkContent);
        if (!dataFlag) {
            // 在类名的前一行插入新的字符串
            entityCode.add(classNameLine, "@Data");
        }

        // 添加 import
        String lombokStr = "import lombok.Data;";
        String typeAnnoStr = "import com.gitee.sunchenbin.mybatis.actable.annotation.ColumnType;";
        String commentAnnoStr = "import com.gitee.sunchenbin.mybatis.actable.annotation.ColumnComment;";
        if (!checkTheContent(entityCode, classNameLine, "package", lombokStr)) {
            entityCode.add(2, lombokStr);
        }
        if (!checkTheContent(entityCode, classNameLine, "package", typeAnnoStr)) {
            entityCode.add(2, typeAnnoStr);
        }
        if (!checkTheContent(entityCode, classNameLine, "package", commentAnnoStr)) {
            entityCode.add(2, commentAnnoStr);
        }

    }

    private static void writeJavaFile(String filePath, List<String> entityCode) throws IOException {
        // 将内容写入原文件
        Path path = Paths.get(filePath);
        Files.write(path, entityCode);
    }
}
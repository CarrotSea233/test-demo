// package utils;

// import java.io.InputStream;

// import org.apache.poi.ss.usermodel.Cell;
// import org.apache.poi.ss.usermodel.CellType;

// public class ExcelHelper {
    

//     // 读取单元格的值
//     private String getValue(Cell cell) {
//         String result = "";

//         switch (cell.getCellType()) {
//         case BOOLEAN:
//             result = cell.getBooleanCellValue() + "";
//             break;
//         case STRING:
//             result = cell.getStringCellValue();
//             break;
//         case FORMULA:
//             result = cell.getCellFormula();
//             break;
//         case NUMERIC:
//             // 可能是普通数字，也可能是日期
//             if (HSSFDateUtil.isCellDateFormatted(cell)) {
//                 result = DateUtil.getJavaDate(cell.getNumericCellValue())
//                         .toString();
//             } else {
//                 result = cell.getNumericCellValue() + "";
//             }
//             break;
//         }
//         return result;
//     }

//     /***
//      * 这种方法支持03，和07版本的excel读取
//      * 但是对于合并的单元格，除了第一行第一列之外，其他部分读取的值为空
//      * @param is
//      */
//     public void importXlsx(InputStream is) {
//         try {
//             Workbook wb = WorkbookFactory.create(is);
//             // OPCPackage pkg = OPCPackage.open(is);
//             // XSSFWorkbook wb = new XSSFWorkbook(pkg);
//             for (int i = 0, len = wb.getNumberOfSheets(); i < len; i++) {
//                 Sheet sheet = wb.getSheetAt(i);
//                 for (int j = 0; j <= sheet.getLastRowNum(); j++) {
//                     if (sheet == null) {
//                         return;
//                     }
//                     Row row = sheet.getRow(j);
//                     if(row==null){
//                         return;
//                     }
//                     // 读取每一个单元格
//                     for (int k = 0; k < row.getLastCellNum(); k++) {
//                         Cell cell = row.getCell(k);
//                         if (cell == null) {
//                             return;
//                         }
//                         System.out.print(getValue(cell));

//                     }
//                     System.out.println();
//                 }
//             }
//         } catch (Exception e) {
//             // TODO Auto-generated catch block
//             e.printStackTrace();
//         }
//     }
// }

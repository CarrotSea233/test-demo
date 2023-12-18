现在你是一名java工程是，我要设计一个程序按指定步骤修改文件内容，设计思路如下：
- 根据指定文件夹获取该文件夹下所有文件的名字，循环运行下面的步骤
- 根据指定的地址读取java文件的内容并保存到String数组entityCode中
- 遍历entityCode数组，将class类的每个变量所在行数和变量名分别保存在两个数组varLine和varName中
- 新建String数组tableFieldName, 遍历varName数组，将每个变量名转换成"小写字母并用下划线分隔"的格式并保存到tableFieldName数组中（例如变量名"userid"转成"user_id"的格式）
- 新建String数组columnCommentName, 遍历varName数组，根据每个变量名的意思转换成中文并保存到tableFieldName数组中
- 新建String数组typeLength，遍历varName数组，调用chatgpt接口发送提问请求并将返回内容保存到typeLength数组中，请求内容如下：
    根据数据库字段名<varName.get(i)>，给出一个合适的字段长度值，返回格式：数据库字段<varName.get(i)>的合适长度值为: <长度>

- 操作entityCode数组，在每个变量所在行数的前面插入新的String，插入内容如下：
    @ColumnType(length=255)
    @ColumnComment("<columnCommentName[i]>")
    @TableField("<tableFieldName[i]>")

- 在类名的前一行插入新的String，插入内容如下：
    @Data

- 将entityCode最后一个变量后的内容全部删掉，只剩最后一行的"}"
- 将entityCode的内容覆盖原来文件的内容



调整：
- 调整saveVariableInfo方法，每个变量String的组成为"private 变量类型 变量名"，根据这个信息调整变量名的获取方式
- 调整convertVariableNames方法，例如变量名"userid"转成"user_id"的格式，根据这个信息调整该方法
- 调整convertVariableComments方法，调用百度翻译的接口将变量名翻译成中文并保存到tableFieldName中
- 所有数组都用ArrayList
- 调整modifyJavaFile方法，添加import
- 调整modifyJavaFile方法，先检查变量前是否包含该注解，如果不包含再插入
// TODO 解决百度翻译有些词没有翻译成中文的问题
// TODO 调用gpt获取字段长度合适值

https://api.chatanywhere.com.cn
https://api.chatanywhere.cn
sk-WhsDNXZLiP2TcFZIN7L0Ux3Bfx7jmnVhYYlgCZ4N1Ym28OCf

ChatGPT转发API密钥，内含30CA币：sk-CRKmMoxkBTNpIaXcEkgnKIvKv4atFdHIhMaetzRahHq9oCQ6
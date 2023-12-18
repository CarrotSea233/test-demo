// package controller.admin.data;

// import java.io.FileNotFoundException;
// import java.io.IOException;
// import java.io.PrintWriter;
// import java.net.URLDecoder;
// import java.net.URLEncoder;
// import java.nio.file.Files;
// import java.util.List;

// import org.apache.commons.fileupload.FileItem;
// import org.apache.commons.fileupload.FileItemFactory;
// import org.apache.commons.fileupload.disk.DiskFileItemFactory;
// import org.apache.commons.fileupload.servlet.ServletFileUpload;
// import org.apache.ibatis.session.SqlSession;

// import jakarta.servlet.ServletException;
// import jakarta.servlet.annotation.WebServlet;
// import jakarta.servlet.http.HttpServlet;
// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;
// import mapper.AdminMapper;
// import model.entity.Admin;
// import model.entity.Login;
// import utils.CookieUtil;
// import utils.MyBatisUtil;

// @WebServlet("/admin/update-data-servlet")
// public class UpdateData extends HttpServlet {

//     private static final long serialVersionUID = 1L; 
//   // 上传文件存储目录
//   private static final String UPLOAD_DIRECTORY = "upload";
//   // 上传配置
//   private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
//   private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
//   private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB

//     @Override
//     protected void doPost(HttpServletRequest request, HttpServletResponse response)
//             throws ServletException, IOException {
//         request.setCharacterEncoding("utf-8");
//         response.setContentType("text/html;charset=utf-8");
//         PrintWriter writer = response.getWriter();

//         String xlsFilePath="";//最后更新为上传xls在服务器上的绝对地址，由excelUpload()返回
//     String result="Error";  //最后更新为xls文件导入数据库正确与否的字符串，由excel2Db返回
//     System.out.println("doPost in Excel2Db");
    
//     //1. 调用excelUpload()将传递过来的excel表写入服务器硬盘，并返回该文件路径------
//     xlsFilePath =excelUpload(request,response);
    
//     //2. 调用excel2Db()将xlsFilePath的excel文件内容读取出来并写入数据库-----------
//     if(!xlsFilePath.equals("Error")){
//       try {
//         result=excel2Db(xlsFilePath);
//       } catch (FileNotFoundException ex) {
//         Logger.getLogger(Excel2DbServlet.class.getName()).log(Level.SEVERE, null, ex);
//       } catch (BiffException ex) {
//         Logger.getLogger(Excel2DbServlet.class.getName()).log(Level.SEVERE, null, ex);
//       }
//     }else{
//       result="Error";
//     }
          
//     //3. 将2的结果result写入响应包
//     //System.out.println("result:="+result);
//     response.getWriter().print(result);  
        
//         try {
//             response.sendRedirect("/test-demo/jsp/admin/data-menu/data-view.jsp");
//         } catch (Exception e) {
//             e.printStackTrace();
//         } finally {
//             // sqlSession.close();
//             writer.flush();
//             writer.close();
//         }

//     }

//     @Override
//     protected void doGet(HttpServletRequest request, HttpServletResponse response)
//             throws ServletException, IOException {
//         doPost(request, response);
//     }

//     //处理excel文件上传的相关程序
//   protected String excelUpload(HttpServletRequest request, HttpServletResponse response)
//           throws ServletException, IOException {
//     String answer="";
//     // 检测是否为多媒体上传
//     if (!ServletFileUpload.isMultipartContent(request)) {
//         // 如果不是则停止
//         PrintWriter writer = response.getWriter();
//         writer.println("Error: 表单必须包含 enctype=multipart/form-data");
//         writer.flush();
 
//         return "Error";
//     }
 
//     // 配置上传参数
//     DiskFileItemFactory factory = new DiskFileItemFactory();
//     // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
//     factory.setSizeThreshold(MEMORY_THRESHOLD);
//     // 设置临时存储目录
//     factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
//     ServletFileUpload upload = new ServletFileUpload(factory);
 
//     // 设置最大文件上传值
//     upload.setFileSizeMax(MAX_FILE_SIZE);        
//     // 设置最大请求值 (包含文件和表单数据)
//     upload.setSizeMax(MAX_REQUEST_SIZE);
//     // 中文处理
//     upload.setHeaderEncoding("UTF-8"); 
 
//     // 构造临时路径来存储上传的文件
//     // 这个路径相对当前应用的目录,这是tomcat5.6.7能用的
//     //String uploadPath = request.getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY;
//     // 这个路径相对当前应用的目录,这是tomcat8以上能用的
//    String uploadPath = this.getClass().getClassLoader().getResource("../../").getPath()+ File.separator + UPLOAD_DIRECTORY;
//     // 如果目录不存在则创建
//     File uploadDir = new File(uploadPath);
//     if (!uploadDir.exists()) {
//         uploadDir.mkdir();
//     }
 
//     try {
//         // 解析请求的内容提取文件数据
//         @SuppressWarnings("unchecked")
//         List<FileItem> formItems = upload.parseRequest(request);
//         if (formItems != null && formItems.size() > 0) {
//             // 迭代表单数据
//             for (FileItem item : formItems) {
//                 // 处理不在表单中的字段
//                 if (!item.isFormField()) {
//                     String fileName = new File(item.getName()).getName();
//                     String filePath = uploadPath + File.separator + fileName;
//                     File storeFile = new File(filePath);
//                     // 在控制台输出文件的上传路径
//                     //System.out.println(filePath);
//                     answer=filePath;
//                     // 保存文件到硬盘
//                     item.write(storeFile);
//                     //request.setAttribute("message","文件上传成功!");
//                 }
//             }
//         }
//     } catch (Exception ex) {
//         System.out.println("erro in Excel2DbServlet excelUpload()"+ex.getMessage());
//     }  
//     return answer;//"服务器上excel文件地址"或者"Error"字符;

// }

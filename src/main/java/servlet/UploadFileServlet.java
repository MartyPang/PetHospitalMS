package servlet;

import dao.ImageDao;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.json.JSONObject;
import util.ImageUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Marty Pang on 2017/2/17.
 */
@WebServlet(name = "UploadFileServlet", urlPatterns = "/upload")
public class UploadFileServlet extends HttpServlet {
    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";
    // 上传配置
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 1024 * 9; // 60MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 1024 * 10; // 70MB

    private static final Logger logger = Logger.getLogger(UploadFileServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        JSONObject jsonObject = new JSONObject();

        // 检测是否为多媒体上传
        if (!ServletFileUpload.isMultipartContent(request)) {
            // 如果不是则停止
            PrintWriter writer = response.getWriter();
            writer.println("Error: 表单必须包含 enctype=multipart/form-data");
            writer.flush();
            jsonObject.put("msg", "error");
            out.write(jsonObject.toString());
            return;
        }


        // 配置上传参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // 设置临时存储目录
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);

        // 设置最大文件上传值
        upload.setFileSizeMax(MAX_FILE_SIZE);

        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // 设置中文文件名编码
        upload.setHeaderEncoding("utf-8");


      //文件类型:text,image,video
        String fileType = request.getParameter("type");
        System.out.println(fileType);
        // 构造临时路径来存储上传的文件
        // 这个路径相对当前应用的目录
        String rootPath = getServletContext().getRealPath("/");
        String uploadPath = getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY + File.separator + fileType;
        //System.out.println(uploadPath);
        //记录上传的文件名



        // 如果目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            // 解析请求的内容提取文件数据
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);//struts2会改变request类型，这里返回null
            //System.out.println(formItems.size());
            if (formItems != null && formItems.size() > 0) {
                // 迭代表单数据
                for (FileItem item : formItems) {
                    // 处理不在表单中的字段

                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();

                        //loadFileName = fileName;

                        String filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        // 在控制台输出文件的上传路径
                        //System.out.println(filePath);
                        // 保存文件到硬盘
                        item.write(storeFile);

                        String pic_name = fileName.substring(0,fileName.lastIndexOf('.'));
                        String pic_type = fileName.substring(fileName.lastIndexOf('.')+1,fileName.length());
                        //生成270*170 和 470*270的缩略图
                        String img_s = uploadPath + File.separator + pic_name + "_s." + pic_type;
                        String img_b = uploadPath + File.separator + pic_name + "_b." + pic_type;

                        ImageUtils.zoomImage(filePath,img_s,270,170);
                        ImageUtils.zoomImage(filePath,img_b,470,370);

                        //绝对路径改为相对路径
                        filePath = File.separator+UPLOAD_DIRECTORY+File.separator+fileType+File.separator+fileName;
                        img_s = File.separator+UPLOAD_DIRECTORY+File.separator+fileType+File.separator+ pic_name + "_s." + pic_type;
                        img_b = File.separator+UPLOAD_DIRECTORY+File.separator+fileType+File.separator+ pic_name + "_b." + pic_type;
                        //将图片信息保存到数据库
                        Map<String, Object> dataMap = new HashMap<String,Object>();
                        dataMap.put("image_path",filePath);
                        dataMap.put("img_s",img_s);
                        dataMap.put("img_b",img_b);
                        new ImageDao().addImage(dataMap);

                        request.setAttribute("message", "upload successful!");
                    }else{
                        //读取表单数据
                        String name = item.getFieldName();
                        String value = new String(item.getString().getBytes("ISO8859_1"),"utf-8");
                        System.out.println(name + " " + value);
                    }
                }
            }
        } catch (Exception ex) {
            request.setAttribute("message", "error: " + ex.getMessage());
            jsonObject.put("msg", "error");
            logger.info("error: "+ex.getMessage());
            out.write(jsonObject.toString());
            return;
        }
        jsonObject.put("msg", "ok");
        out.write(jsonObject.toString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

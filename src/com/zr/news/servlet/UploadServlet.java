package com.zr.news.servlet;

import com.alibaba.fastjson.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

/**
 * @author : 张晋飞
 * date : 2019/3/22
 */
@WebServlet(name = "UploadServlet",urlPatterns = "/uploadImage")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        File savePath =  new File("D:\\files\\","image");
        savePath.mkdirs();
        String uuid = UUID.randomUUID().toString().replace("-", "");

        Part part = request.getPart("upload");//通过表单file控件(<input type="file" name="upfile">)的名字直接获取Part对象
        //Servlet3没有提供直接获取文件名的方法,需要从请求头中解析出来
        //获取请求头，请求头的格式：form-data; name="file"; filename="snmp4j--api.zip"
        String header = part.getHeader("content-disposition");
        //获取文件名
        String fileName ="";
        if(header.contains("filename")) {
            String[] strArr = header.split("\"");
            fileName = uuid+"_"+strArr[strArr.length-1];
        }

        System.out.println("fileName:"+fileName);
        //把文件写到指定路径
        part.write(savePath+"/"+fileName);

        PrintWriter out = response.getWriter();
        // CKEditorFuncNum是回调时显示的位置，这个参数必须有
        JSONObject json = new JSONObject();
        json.put("uploaded",1);
        json.put("fileName",fileName);
        json.put("url",fileName);

        request.getSession().setAttribute("image",fileName);
        System.out.println(json);
        out.print(json);
        out.flush();
        out.close();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

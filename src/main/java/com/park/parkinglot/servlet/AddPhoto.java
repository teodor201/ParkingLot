/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.park.parkinglot.servlet;

import com.park.parkinglot.common.CarDetails;
import com.park.parkinglot.ejb.CarBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Teodor
 */
@MultipartConfig
@WebServlet(name = "AddPhoto", urlPatterns = {"/AddPhoto"})
public class AddPhoto extends HttpServlet {

    
    @Inject
    CarBean carBean;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addPhoto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addPhoto at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer carId = Integer.parseInt(request.getParameter("id"));
        CarDetails car = carBean.findByID(carId);
        request.setAttribute("car", car);
        
        request.getRequestDispatcher("./WEB-INF/pages/addPhoto.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr  = request.getParameter("car_id");
        Integer id = Integer.parseInt(idStr);
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        String fileType = filePart.getContentType();
        long fileSize = filePart.getSize();
        byte[] fileContent = new byte[(int) fileSize];
        filePart.getInputStream().read(fileContent);
        
        carBean.addPhotoToCar(id, fileName, fileType, fileContent);
        response.sendRedirect(request.getContextPath() + "/Cars");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

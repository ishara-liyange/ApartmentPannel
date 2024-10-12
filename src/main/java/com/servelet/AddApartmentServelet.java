package com.servelet;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.DAO.ApartmentDao;

/**
 * Servlet implementation class AddApartmentServelet
 */
@WebServlet("/AddApartmentServelet")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
	    maxFileSize = 1024 * 1024 * 10,       // 10MB
	    maxRequestSize = 1024 * 1024 * 50     // 50MB
	)
public class AddApartmentServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddApartmentServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String apartmentName = request.getParameter("apartmentName");
        String location = request.getParameter("location");
        int numberOfRooms = Integer.parseInt(request.getParameter("numberOfRooms"));
        double price = Double.parseDouble(request.getParameter("price"));

        // Save image to server
        String imageUrl = saveImageToDatabase(request);

        // Add product to database
        boolean isTrue = ApartmentDao.addApartment(apartmentName, location, numberOfRooms, price, imageUrl);
		
        if (isTrue) {
            response.sendRedirect("apartments.jsp");
        } else {
            response.sendRedirect("addApartment.jsp");
        }
	}
	
	private String saveImageToDatabase(HttpServletRequest request) throws IOException, ServletException {
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            if (fileName != null && !fileName.isEmpty()) {
                try (InputStream fileContent = part.getInputStream()) {
                    byte[] imageBytes = fileContent.readAllBytes();
                    String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                    return "data:image/jpeg;base64," + base64Image;
                }
            }
        }
        return null;
    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        if (contentDisposition != null) {
            String[] elements = contentDisposition.split(";");
            for (String element : elements) {
                if (element.trim().startsWith("filename")) {
                    return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
                }
            }
        }
        return null;
    }

}

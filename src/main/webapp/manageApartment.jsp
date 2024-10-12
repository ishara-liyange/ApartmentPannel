<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.connection.DBConnect"%>
<%@ include file="sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Apartment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #000000;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #000000;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
            margin-bottom: 20px;
            color: #ffffff;
            text-align: center;
        }

        label {
            margin-bottom: 5px;
            display: block;
            font-weight: bold;
            color: #ffffff;
        }

        input[type="text"],
        input[type="number"],
        textarea,
        input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 25px; /* Increased space between fields */
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }

        button[type="reset"] {
            background-color: #6c757d;
        }

        button:hover {
            opacity: 0.9;
        }

        img {
            max-width: 100%;
            height: auto;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <%
        Connection con = null;
    %>
    

    <!-- Page Content -->
    <div class="container">


        <h1>Update Apartments</h1>

        <form method="post" action="/apartment/UpdateApartmentServelet" enctype="multipart/form-data">
            <%
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    con = DBConnect.getConnection();
                    String sql = "SELECT * FROM apartment WHERE apartmentId = ?";
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setInt(1, id);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        int apartmentId = rs.getInt("apartmentId");
                        String apartmentName = rs.getString("apartmentName");
                        String location = rs.getString("location");
                        int numberOfRooms = rs.getString("numberOfRooms") != null && !rs.getString("numberOfRooms").isEmpty() ? Integer.parseInt(rs.getString("numberOfRooms")) : 0;
                        double price = rs.getString("price") != null && !rs.getString("price").isEmpty() ? Double.parseDouble(rs.getString("price")) : 0.0;
                        String imageUrl = rs.getString("imageUrl");
            %>
                <div>
                    <label for="apartmentname">Apartment Name</label>
                    <input type="text" id="apartmentname" name="apartmentname" value="<%= apartmentName %>">
                </div>
                <div>
                    <label for="location">Location</label>
                    <textarea id="location" name="location"><%= location %></textarea>
                </div>

                <div>
                    <label for="numberOfRooms">Number Of Rooms</label>
                    <input type="number" id="numberOfRooms" name="numberOfRooms" value="<%= numberOfRooms %>">
                </div>
                <div>
                    <label for="price">Price</label>
                    <input type="number" step="0.01" id="price" name="price" value="<%= price %>">
                </div>
                                <div>
                    <label for="image">Choose Image</label>
                    <input type="file" id="image" name="image"><br>
                    <img id="image-preview" src="<%= imageUrl %>" alt="Image Preview">
                </div>
                <input type="hidden" id="apartmentId" name="apartmentId" value="<%= apartmentId %>">
                <button type="submit">Update</button>  
                <button type="reset">Cancel</button>
            <%
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </form>
    </div>

</body>
</html>

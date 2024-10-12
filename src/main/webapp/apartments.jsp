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
    <title>Apartment List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #000000;
            margin: 20px;
        }
        .content {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            background-color: #000000;
         
          
        }
        h1 {
            text-align: center;
            color: #ffffff;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-spacing: 0 15px; /* Space between rows */
        }
        th, td {
            padding: 15px 20px; /* More padding for space between columns */
            text-align: left;
        }
        th {
            background-color: #7e7e7e;
            color: white;
            border: none; /* Remove table lines */
            border-radius: 10px 10px 0 0; /* Rounded corners for the top */
        }
        td {
            background-color: #f8f9fa;
            border: none; /* Remove table lines */
            border-radius: 10px; /* Rounded corners for cells */
        }
        td img {
            width: 75px;
            height: 75px;
            object-fit: cover;
            border-radius: 5px;
        }
        tr:nth-child(even) td {
            background-color: #d8d8d8; /* Light background for alternating rows */
        }
        tr:hover td {
            background-color: #f1f1f1; /* Hover effect for rows */
        }
        .action-link {
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 14px;
            color: #fff;
            background-color: #28a745;
            margin-right: 10px;
        }
        .action-link.delete {
            background-color: #dc3545;
        }
        .action-link:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>

    <%
        Connection con = null;
    %>

    <div class="content">
        <h1>Apartments</h1>

        <table>
            <thead>
                <tr>
                    <th>Apartment ID</th>
                    <th>Apartment Name</th>
                    <th>Location</th>
                    <th>Number Of Rooms</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    try {
                        con = DBConnect.getConnection();
                        String sql = "SELECT * FROM apartment";
                        PreparedStatement ps = con.prepareStatement(sql);
                        ResultSet rs = ps.executeQuery();
                        
                        while (rs.next()) {
                            String apartmentId = rs.getString("apartmentId");
                            String apartmentName = rs.getString("apartmentName");
                            String location = rs.getString("location");
                            int numberOfRooms = rs.getInt("numberOfRooms");
                            double price = rs.getDouble("price");
                            String imageUrl = rs.getString("imageUrl");
                %>
                <tr>
                    <td><%= apartmentId %></td>
                    <td><%= apartmentName %></td>
                    <td><%= location %></td>
                    <td><%= numberOfRooms %></td>
                    <td><%= price %></td>
                    <td><img src="<%= imageUrl %>" alt="Image"></td>
                    <td><a href="manageApartment.jsp?id=<%= apartmentId %>" class="action-link">Edit</a></td>
                    <td><a href="deleteApartment.jsp?id=<%= apartmentId %>" class="action-link delete">Delete</a></td>
                </tr>
                <% 
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>

</body>
</html>

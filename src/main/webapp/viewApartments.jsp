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
    <title>Available Apartments</title>
    <style>
        body {
            background-color: #000000;
            font-family: 'Roboto Condensed', sans-serif;
            margin: 0;
            padding: 20px;
        }
        .page-header {
            margin: 20px 0;
            text-align: center;
            color:#ffffff;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        .row {
            display: flex;
            flex-wrap: wrap;
            margin: -10px;
        }
        .col-md-12, .col-lg-4, .col-md-6 {
            padding: 10px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            background-color: #ffffff;
            overflow: hidden;
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.02);
        }
        .card-img-top {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .card-body {
            padding: 20px;
        }
        .card-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 10px;
        }
        .card-text {
            font-size: 0.9rem;
            color: #555;
        }
        .card-text strong {
            color: #000;
        }
    </style>
</head>
<body>
<%
    Connection con = null;
%>

<!-- Title -->
<div class="container">
    <div class="page-header">
        <h1>Explore Our Available Apartments</h1>
        <p class="lead">Find your next home from our list of amazing apartments.</p>
    </div>

    <div class="row">
        <div class="col-md-12">
            <!-- Apartment Cards -->
            <div class="row">
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
                <!-- Single Apartment Card -->
                <div class="col-lg-4 col-md-6">
                    <div class="card">
                        <img class="card-img-top" src="<%= imageUrl %>" alt="Apartment Image">
                        <div class="card-body">
                            <h5 class="card-title"><%= apartmentName %></h5>
                            <p class="card-text">
                                <strong>Location:</strong> <%= location %><br>
                                <strong>Rooms:</strong> <%= numberOfRooms %><br>
                                <strong>Price:</strong> $<%= price %>
                            </p>
                        </div>
                    </div>
                </div>
                <% 
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
        </div>
    </div>
</div>

</body>
</html>

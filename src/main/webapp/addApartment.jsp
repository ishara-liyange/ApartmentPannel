<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnect"%>
<%@ include file="sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Product</title>
    <style>
        /* Simple CSS for form styling */
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color:#000000;
        }
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color:#000000;
            
            
        }
        .form-container h3 {
            margin-bottom: 20px;
            text-align: center;
            color:#ffffff;
            
        }
        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 25px; /* Added more space between input fields */
        }
        .form-group label {
            margin-bottom: 8px; /* Space between label and input */
            font-weight: bold;
            color:#ffffff;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group img {
            max-width: 100%;
            max-height: 300px;
            margin-top: 10px;
        }
        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .btn {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 48%;
        }
        .btn-blue {
            background-color: #007BFF;
            color: white;
        }
        .btn-white {
            background-color: #f8f9fa;
            color: black;
        }
    </style>
</head>
<body>



    <div class="form-container">
        <h3>Add Apartment</h3>
        <form method="post" action="/apartment/AddApartmentServelet" enctype="multipart/form-data">
            <div class="form-group">
                <label for="apartmentName">Apartment Name</label>
                <input type="text" id="apartmentName" name="apartmentName">
            </div>
            <div class="form-group">
                <label for="location">Location</label>
                <textarea id="location" name="location"></textarea>
            </div>
            
            <div class="form-group">
                <label for="numberOfRooms">Number Of Rooms</label>
                <input type="number" id="numberOfRooms" name="numberOfRooms">
            </div>
            <div class="form-group">
                <label for="price">Price</label>
                <input type="number" step="0.01" id="price" name="price">
            </div>
            <div class="form-group">
                <label for="image">Choose Image</label>
                <input type="file" id="image" name="image" onchange="previewImage(event)">
                <img id="image-preview" src="#" alt="Image Preview">
            </div>
            <div class="btn-container">
                <button type="submit" class="btn btn-blue">Submit</button>
                <button type="reset" class="btn btn-white">Cancel</button>
            </div>
        </form>
    </div>

    <script>
        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function() {
                var output = document.getElementById('image-preview');
                output.src = reader.result;
            }
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>

</body>
</html>

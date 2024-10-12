<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    .sidebar {
        width: 250px;
        background-color: #ffffff;
        color: #000000;
        padding: 20px;
        height: 100vh; /* Full height */
        position: fixed; /* Fixes sidebar on the left */
    }

    .sidebar h2 {
        margin-top: 0;
        color:#000000;
    }

    .sidebar a {
        color: #000000;
        text-decoration: none;
        display: block;
        padding: 10px 15px;
        margin: 5px 0;
        border-radius: 4px;
    }

    .sidebar a:hover {
        background-color: #575757;
        color:#ffffff;
    }
</style>

<div class="sidebar">
    <h2>Apartment Menu</h2>

    <a href="apartments.jsp">Apartments</a>
    <a href="addApartment.jsp">Add Apartments</a>
	<a href="viewApartments.jsp">View Apartments</a>

</div>

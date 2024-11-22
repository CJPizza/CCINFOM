<%-- 
    Document   : addPet
    Created on : Nov 13, 2024, 11:46:06 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, PetCafe.*"%>
<%@page import="java.sql.*, PetCafe.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP File</title>
    </head>
    <body>
        <form action="index.html">
            <jsp:useBean id="A" class="PetCafe.pet" scope="session" />
            <%
                String vpetname = request.getParameter("petname");
                String vpetspecies = request.getParameter("petspecies");
                String vpetbreed = request.getParameter("petbreed");
                int vownerid = Integer.parseInt(request.getParameter("ownerid"));

                int status = A.addPet(vpetname, vpetspecies, vpetbreed, vownerid);

                if (status == 1) {
            %>
            <h1>Registering Pet Successful!</h1>
            <%
                } else if (status == 0){
            %>
                <h1>Registration Failed.</h1>
                <ul>
                <li>Pet Name: <%= vpetname != null ? vpetname : "N/A" %></li>
                <li>Pet Species: <%= vpetspecies != null ? vpetspecies : "N/A" %></li>
                <li>Pet Breed: <%= vpetbreed != null ? vpetbreed : "N/A" %></li>
                <li>Owner ID: <%= vownerid > 0 ? vownerid : "Invalid or Not Provided" %></li>
                </ul>
                <p>Please correct the above details and try again.</p>
            <%
                }
            %>
            <input type="submit" value="Return to Menu">
        </form>
    </body>
</html>

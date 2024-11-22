<%-- 
    Document   : editPet
    Created on : Nov 22, 2024, 6:06:36 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, PetCafe.*"%>
<%@page import="java.sql.*, PetCafe.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="index.html">
            <jsp:useBean id="A" class="PetCafe.pet" scope="session" />
            <%
                int vpetid = Integer.parseInt(request.getParameter("petid"));
                String vpetname = request.getParameter("petname");
                String vpetspecies = request.getParameter("petspecies");
                String vpetbreed = request.getParameter("petbreed");
                int vownerid = Integer.parseInt(request.getParameter("ownerid"));
                
                int status = A.updatePet(vpetid, vpetname, vpetspecies, vpetbreed, vownerid);
                
                if (status == 1) {
            %>
                <h1>Update Successful!</h1>
            <%
                } else if (status == 0){
            %>
                <h1>Deletion Failed.</h1>
                <ul>
                <li>Pet ID: <%= vpetid > 0 ? vpetid : "N/A" %> does not exist.</li>
                <p>Please correct the above detail and try again.</p>
            <%
                }
            %>
            <input type="submit" value="Return to Menu">
        </form>
    </body>
</html>

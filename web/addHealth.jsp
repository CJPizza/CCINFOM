<%-- 
    Document   : addHealth
    Created on : Nov 22, 2024, 7:28:57 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, PetCafe.*"%>
<%@page import="java.sql.*, PetCafe.*"%>
<%@page import="PetCafe.health.vaccination_status"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="index.html">
            <jsp:useBean id="A" class="PetCafe.health" scope="session" />
            <%
                int vpetid = Integer.parseInt(request.getParameter("petid"));
                String vaccinationStatus = request.getParameter("vaccination_status");
                vaccination_status vaccinationStatus = vaccination_status.valueOf(vaccinationStatusParam);
                String vspecialneeds = request.getParameter("specialneeds");
                String vongoingtreatment = request.getParameter("ongoingtreatment");
                Date vtreatment_start = Date.valueOf(request.getParameter("treatment_start"));
                Date vtreatment_end = Date.valueOf(request.getParameter("treatment_end"));
                
                int status = healthRecord.addHealthHistory(vpetid, vaccinationStatus, vspecialneeds, vongoingtreatment, vtreatment_start, vtreatment_end);
                if (status == 1) {
            %>
                <h1>Registering Pet Successful!</h1>
            <%
                } else if (status == 0){
            %>
                <h1>Registration Failed.</h1>
            <%
                }
            %>
            <input type="submit" value="Return to Menu">
        </form>
    </body>
</html>

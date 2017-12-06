<%-- 
 *      Author ::: Brian Sterling
 *     Program ::: Bases de Datos
 *  Credential ::: SIST0008-G01:SIV
--%>
<%@page import="modelo.Grupo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Grupo</title>
    </head>
    <body>
        <%
            Grupo user = (Grupo) request.getAttribute("user");
            
            if (request.getParameter("action").equals("insert"))
            {
        %>
        <form method="POST" action='UserController' name="frmAddUser">
            Consultor ID : <input type="text" readonly="readonly" name="userid"/>
            <br /> 
            Lider ID : <input type="text" name="firstName"/>
            <br />
            Emplead ID : <input type="text" name="lastName"/>
            <br />
            <input type="submit" value="Submit" />
        </form>
        <%
            }
            else
            {
        %>
        <form method="POST" action='UserController' name="frmAddUser">
            Consultor ID : <input type="text" readonly="readonly" name="userid" value="<%=user.getIdGrupo()%>" />
            <br /> 
            Lider ID : <input type="text" name="firstName" value="<%=user.getIdLider()%>" />
            <br />
            Emplead ID : <input type="text" name="lastName" value="<%=user.getIdEmpleado()%>" />
            <br />
            <input type="submit" value="Submit" />
        </form>
        <%
            }
        %>
    </body>
</html>
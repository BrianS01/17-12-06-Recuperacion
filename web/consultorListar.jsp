<%-- 
 *      Author ::: Brian Sterling
 *     Program ::: Bases de Datos
 *  Credential ::: SIST0008-G01:SIV
--%>
<%@page import="modelo.Consultor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Consultor</title>
    </head>
    <body>
        <table border=1>
            <thead>
                <tr>
                    <th>Consultor Id</th>
                    <th>Labor</th>
                    <th colspan=2>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Consultor> users = (List<Consultor>) request.getAttribute("consultor");
                    if (users != null)
                    {
                        for (Consultor user : users)
                        {
                %>
                <tr>
                    <td><%=user.getIdConsultor()%></td>
                    <td><%=user.getLabor()%></td>
                    <td><a href="ConsultorControlador?action=edit&idConsultor=<%=user.getIdConsultor()%>">Actualizar</a></td>
                    <td><a href="ConsultorControlador?action=delete&idConsultor=<%=user.getIdConsultor()%>">Borrar</a></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <p>
            <a href="ConsultorControlador?action=insert">Agregar</a>
        </p>
    </body>
</html>
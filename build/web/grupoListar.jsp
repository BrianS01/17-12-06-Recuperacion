<%-- 
 *      Author ::: Brian Sterling
 *     Program ::: Bases de Datos
 *  Credential ::: SIST0008-G01:SIV
--%>
<%@page import="modelo.Grupo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Grupo</title>
    </head>
    <body>
        <table border=1>
            <thead>
                <tr>
                    <th>Grupo Id</th>
                    <th>Lider Id</th>
                    <th>Empleado Id</th>
                    <th colspan=2>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Grupo> users = (List<Grupo>) request.getAttribute("grupo");
                    if (users != null)
                    {
                        for (Grupo user : users)
                        {
                %>
                <tr>
                    <td><%=user.getIdGrupo()%></td>
                    <td><%=user.getIdLider()%></td>
                    <td><%=user.getIdEmpleado()%></td>
                    <td><a href="GrupoControlador?action=edit&idGrupo=<%=user.getIdGrupo()%>">Actualizar</a></td>
                    <td><a href="GrupoControlador?action=delete&idGrupo=<%=user.getIdGrupo()%>">Borrar</a></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <p>
            <a href="GrupoControlador?action=insert">Agregar</a>
        </p>
    </body>
</html>
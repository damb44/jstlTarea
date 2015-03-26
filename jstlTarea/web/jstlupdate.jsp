<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%-- 
    Document   : jstlupdate
    Created on : 26/03/2015, 12:30:15 AM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
       
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualizar Datos</title>
    </head>
    <body>
        
        <sql:setDataSource var="bdatos" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/prueba"
        user="root"  password="1234"/>
        
        <sql:update  var="dato" scope="session" dataSource="${bdatos}" >
            UPDATE clientes
            SET nombres = 'carlos'
            WHERE nombres = 'andres';
        </sql:update>
        
        
        <sql:query  var="result" dataSource="${bdatos}">
            SELECT * from clientes;
        </sql:query>
            
        <table border="1" width="100%">
            <tr>
                <th>ID Cliente</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Direcion</th>
                <th>Edad</th>
                <th>Telefono</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
            <tr>
            <td><c:out value="${row.idClientes}"/></td>
            <td><c:out value="${row.nombres}"/></td>
            <td><c:out value="${row.apellidos}"/></td>
            <td><c:out value="${row.direccion}"/></td>
            <td><c:out value="${row.edad}"/></td>
            <td><c:out value="${row.telefono}"/></td>
            </tr>
            </c:forEach>
        </table>
         
    </body>
</html>

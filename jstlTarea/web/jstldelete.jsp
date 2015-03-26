<%-- 
    Document   : jstldelete
    Created on : 26/03/2015, 01:06:52 AM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <sql:setDataSource var="bdatos" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/prueba"
        user="root"  password="1234"/>
        
        
        <sql:update var="dato" scope="session" dataSource="${bdatos}">
            DELETE FROM clientes
            WHERE telefono = '7226617';
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

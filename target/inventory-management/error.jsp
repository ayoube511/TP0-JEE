<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ include file="header.jsp" %>

<div class="alert alert-danger shadow-sm">
    <h3>⚠️ Une erreur s'est produite</h3>
    <p>Veuillez réessayer plus tard ou contacter l'administrateur.</p>
    <% if (exception != null) { %>
        <hr>
        <p class="mb-0"><strong>Détail :</strong> <%= exception.getMessage() %></p>
    <% } %>
    <hr>
    <a href="<%= request.getContextPath() %>/" class="btn btn-primary">🏠 Retour à l'accueil</a>
</div>

<%@ include file="footer.jsp" %>

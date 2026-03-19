<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>👤 Liste des Utilisateurs</h2>
    <a href="<%= request.getContextPath() %>/user-form" class="btn btn-success">➕ Ajouter un Utilisateur</a>
</div>
<hr>

<c:choose>
    <c:when test="${empty users}">
        <div class="alert alert-info">Aucun utilisateur trouvé. <a href="<%= request.getContextPath() %>/user-form">Ajouter le premier utilisateur</a>.</div>
    </c:when>
    <c:otherwise>
        <table class="table table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Prénom</th>
                    <th>Nom</th>
                    <th>Email</th>
                    <th>Date de création</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td><c:out value="${user.id}" /></td>
                        <td><c:out value="${user.firstName}" /></td>
                        <td><c:out value="${user.lastName}" /></td>
                        <td><c:out value="${user.email}" /></td>
                        <td><c:out value="${user.createdAt}" /></td>
                        <td>
                            <a href="<%= request.getContextPath() %>/user-form?action=edit&id=<c:out value='${user.id}' />"
                               class="btn btn-primary btn-sm">✏️ Modifier</a>
                            &nbsp;
                            <a href="<%= request.getContextPath() %>/delete-user?id=<c:out value='${user.id}' />"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet utilisateur ?')">🗑️ Supprimer</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

<%@ include file="footer.jsp" %>

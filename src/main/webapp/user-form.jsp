<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="row justify-content-center">
    <div class="col-md-7">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">
                    <c:choose>
                        <c:when test="${user != null}">✏️ Modifier l'Utilisateur</c:when>
                        <c:otherwise>➕ Ajouter un Utilisateur</c:otherwise>
                    </c:choose>
                </h4>
            </div>
            <div class="card-body">
                <c:choose>
                    <c:when test="${user != null}">
                        <form action="<%= request.getContextPath() %>/update-user" method="post">
                        <input type="hidden" name="id" value="<c:out value='${user.id}' />" />
                    </c:when>
                    <c:otherwise>
                        <form action="<%= request.getContextPath() %>/create-user" method="post">
                    </c:otherwise>
                </c:choose>

                <div class="form-group">
                    <label for="firstName">Prénom <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="firstName" name="firstName"
                           value="<c:out value='${user.firstName}' />" required>
                </div>

                <div class="form-group">
                    <label for="lastName">Nom <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="lastName" name="lastName"
                           value="<c:out value='${user.lastName}' />" required>
                </div>

                <div class="form-group">
                    <label for="email">Email <span class="text-danger">*</span></label>
                    <input type="email" class="form-control" id="email" name="email"
                           value="<c:out value='${user.email}' />" required>
                </div>

                <div class="form-group">
                    <label for="password">Mot de passe <c:if test="${user == null}"><span class="text-danger">*</span></c:if></label>
                    <input type="password" class="form-control" id="password" name="password"
                           <c:if test="${user == null}">required</c:if>>
                    <c:if test="${user != null}">
                        <small class="form-text text-muted">Laissez vide pour conserver le mot de passe actuel.</small>
                    </c:if>
                </div>

                <div class="mt-3">
                    <button type="submit" class="btn btn-primary">💾 Enregistrer</button>
                    <a href="<%= request.getContextPath() %>/users" class="btn btn-secondary ml-2">❌ Annuler</a>
                </div>

                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

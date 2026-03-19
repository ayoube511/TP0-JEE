<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="jumbotron bg-white shadow-sm">
    <h1 class="display-4">🏪 Bienvenue dans l'application de Gestion d'Inventaire</h1>
    <p class="lead">Cette application démontre l'intégration de <strong>JSP</strong>, <strong>Servlet</strong>, <strong>Hibernate</strong> avec <strong>Jakarta EE</strong> et un <strong>DAO générique</strong>.</p>
    <hr class="my-4">
    <p>Utilisez les cartes ci-dessous pour naviguer dans l'application :</p>

    <div class="row mt-4">
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0">👤 Gestion des Utilisateurs</h5>
                </div>
                <div class="card-body">
                    <p class="card-text">Gérez les utilisateurs de l'application : ajout, modification et suppression.</p>
                    <a class="btn btn-primary mr-2" href="<%= request.getContextPath() %>/users" role="button">📋 Voir les Utilisateurs</a>
                    <a class="btn btn-success" href="<%= request.getContextPath() %>/user-form" role="button">➕ Ajouter</a>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-header bg-success text-white">
                    <h5 class="mb-0">📦 Gestion des Produits</h5>
                </div>
                <div class="card-body">
                    <p class="card-text">Gérez l'inventaire des produits : ajout, recherche, modification et suppression.</p>
                    <a class="btn btn-primary mr-2" href="<%= request.getContextPath() %>/products" role="button">📋 Voir les Produits</a>
                    <a class="btn btn-success" href="<%= request.getContextPath() %>/product-form" role="button">➕ Ajouter</a>
                </div>
            </div>
        </div>
    </div>

    <div class="card mt-2">
        <div class="card-header bg-secondary text-white">⚙️ Architecture Technique</div>
        <div class="card-body">
            <ul class="mb-0">
                <li><strong>Modèle :</strong> Entités JPA (<code>User</code>, <code>Product</code>) + DAO Générique (<code>GenericDAOImpl</code>)</li>
                <li><strong>Vue :</strong> JSP + JSTL + Bootstrap 4</li>
                <li><strong>Contrôleur :</strong> Servlets Jakarta EE (<code>@WebServlet</code>)</li>
                <li><strong>Persistance :</strong> Hibernate 6 + H2 (par défaut) ou MySQL</li>
            </ul>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

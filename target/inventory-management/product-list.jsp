<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>📦 Liste des Produits</h2>
    <a href="<%= request.getContextPath() %>/product-form" class="btn btn-success">➕ Ajouter un Produit</a>
</div>
<hr>

<!-- Barre de recherche -->
<div class="row mb-3">
    <div class="col-md-5 ml-auto">
        <form action="<%= request.getContextPath() %>/products" method="get" class="form-inline justify-content-end">
            <input type="text" class="form-control mr-2" name="keyword"
                   placeholder="🔍 Rechercher par nom ou description..."
                   value="<c:out value='${keyword}' />" style="width:280px;">
            <button type="submit" class="btn btn-primary">Rechercher</button>
            <c:if test="${not empty keyword}">
                <a href="<%= request.getContextPath() %>/products" class="btn btn-outline-secondary ml-2">✖ Effacer</a>
            </c:if>
        </form>
    </div>
</div>

<c:if test="${not empty keyword}">
    <div class="alert alert-info">Résultats pour : <strong><c:out value="${keyword}" /></strong></div>
</c:if>

<c:choose>
    <c:when test="${empty products}">
        <div class="alert alert-warning">Aucun produit trouvé. <a href="<%= request.getContextPath() %>/product-form">Ajouter le premier produit</a>.</div>
    </c:when>
    <c:otherwise>
        <table class="table table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Description</th>
                    <th>Prix</th>
                    <th>Stock</th>
                    <th>SKU</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td><c:out value="${product.id}" /></td>
                        <td><strong><c:out value="${product.name}" /></strong></td>
                        <td><c:out value="${product.description}" /></td>
                        <td><span class="badge badge-success"><c:out value="${product.price}" /> €</span></td>
                        <td>
                            <c:choose>
                                <c:when test="${product.stockQuantity <= 5}">
                                    <span class="badge badge-danger"><c:out value="${product.stockQuantity}" /></span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-primary"><c:out value="${product.stockQuantity}" /></span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td><code><c:out value="${product.sku}" /></code></td>
                        <td>
                            <a href="<%= request.getContextPath() %>/product-form?action=edit&id=<c:out value='${product.id}' />"
                               class="btn btn-primary btn-sm">✏️ Modifier</a>
                            &nbsp;
                            <a href="<%= request.getContextPath() %>/delete-product?id=<c:out value='${product.id}' />"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce produit ?')">🗑️ Supprimer</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>

<%@ include file="footer.jsp" %>

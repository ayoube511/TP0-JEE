<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="row justify-content-center">
    <div class="col-md-7">
        <div class="card shadow-sm">
            <div class="card-header bg-success text-white">
                <h4 class="mb-0">
                    <c:choose>
                        <c:when test="${product != null}">✏️ Modifier le Produit</c:when>
                        <c:otherwise>➕ Ajouter un Produit</c:otherwise>
                    </c:choose>
                </h4>
            </div>
            <div class="card-body">
                <c:choose>
                    <c:when test="${product != null}">
                        <form action="<%= request.getContextPath() %>/update-product" method="post">
                        <input type="hidden" name="id" value="<c:out value='${product.id}' />" />
                    </c:when>
                    <c:otherwise>
                        <form action="<%= request.getContextPath() %>/create-product" method="post">
                    </c:otherwise>
                </c:choose>

                <div class="form-group">
                    <label for="name">Nom du produit <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="name" name="name"
                           value="<c:out value='${product.name}' />" required>
                </div>

                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea class="form-control" id="description" name="description" rows="3"><c:out value='${product.description}' /></textarea>
                </div>

                <div class="form-group">
                    <label for="price">Prix (€) <span class="text-danger">*</span></label>
                    <input type="number" step="0.01" min="0" class="form-control" id="price" name="price"
                           value="<c:out value='${product.price}' />" required>
                </div>

                <div class="form-group">
                    <label for="stockQuantity">Quantité en stock <span class="text-danger">*</span></label>
                    <input type="number" min="0" class="form-control" id="stockQuantity" name="stockQuantity"
                           value="<c:out value='${product.stockQuantity}' />" required>
                </div>

                <div class="form-group">
                    <label for="sku">SKU (Code produit unique) <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="sku" name="sku"
                           value="<c:out value='${product.sku}' />" required>
                    <small class="form-text text-muted">Exemple : PROD-001, SKU-ABC-123</small>
                </div>

                <div class="mt-3">
                    <button type="submit" class="btn btn-success">💾 Enregistrer</button>
                    <a href="<%= request.getContextPath() %>/products" class="btn btn-secondary ml-2">❌ Annuler</a>
                </div>

                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

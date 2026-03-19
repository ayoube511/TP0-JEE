<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Gestion d'Inventaire</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .navbar-brand { font-weight: bold; }
        .card { border-radius: 10px; box-shadow: 0 2px 6px rgba(0,0,0,0.1); }
        .table thead { background-color: #343a40; color: white; }
    </style>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="<%= request.getContextPath() %>/">🏪 Gestion d'Inventaire</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">
                                👤 Utilisateurs
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="<%= request.getContextPath() %>/users">📋 Liste des Utilisateurs</a>
                                <a class="dropdown-item" href="<%= request.getContextPath() %>/user-form">➕ Ajouter Utilisateur</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown">
                                📦 Produits
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="<%= request.getContextPath() %>/products">📋 Liste des Produits</a>
                                <a class="dropdown-item" href="<%= request.getContextPath() %>/product-form">➕ Ajouter Produit</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="container mt-4">

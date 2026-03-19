# 🏪 Inventory Management App

> Application web Java complète avec **JSP + Servlet + Hibernate + Jakarta EE** et pattern **DAO Générique**.

![Java](https://img.shields.io/badge/Java-11+-orange?style=flat-square&logo=java)
![Hibernate](https://img.shields.io/badge/Hibernate-6.0-blue?style=flat-square)
![Tomcat](https://img.shields.io/badge/Tomcat-10.1-green?style=flat-square)
![Jakarta EE](https://img.shields.io/badge/Jakarta%20EE-9.1-purple?style=flat-square)
![Maven](https://img.shields.io/badge/Maven-3.x-red?style=flat-square)

---

## 📋 Description

Application de gestion d'inventaire permettant de gérer des **utilisateurs** et des **produits** via une interface web.  
Ce projet illustre l'architecture **MVC** avec un **DAO Générique** réutilisable pour toutes les entités.

---

## Resultat et apperçu 
<img width="1919" height="929" alt="Capture d&#39;écran 2026-03-19 131850" src="https://github.com/user-attachments/assets/1df2a425-0e3b-43b6-8543-b15dc1701bcc" />
<img width="1919" height="928" alt="Capture d&#39;écran 2026-03-19 131917" src="https://github.com/user-attachments/assets/3f0683ab-315e-4313-9f7b-cd422ea15a7b" />
<img width="1919" height="929" alt="Capture d&#39;écran 2026-03-19 131930" src="https://github.com/user-attachments/assets/4f5d8f5e-3f75-4fdb-9e0a-35edd6c1895a" />

---

## ✨ Fonctionnalités

### 👤 Gestion des Utilisateurs
- ➕ Ajouter un utilisateur
- 📋 Lister tous les utilisateurs
- ✏️ Modifier un utilisateur
- 🗑️ Supprimer un utilisateur

### 📦 Gestion des Produits
- ➕ Ajouter un produit
- 📋 Lister tous les produits
- 🔍 Rechercher par nom ou description
- ✏️ Modifier un produit
- 🗑️ Supprimer un produit

---

## 🏗️ Architecture du projet
```
inventory-management/
├── src/
│   └── main/
│       ├── java/com/example/
│       │   ├── controller/        # Servlets (MVC - Contrôleur)
│       │   │   ├── UserListServlet.java
│       │   │   ├── UserFormServlet.java
│       │   │   ├── UserCreateServlet.java
│       │   │   ├── UserUpdateServlet.java
│       │   │   ├── UserDeleteServlet.java
│       │   │   ├── ProductListServlet.java
│       │   │   ├── ProductFormServlet.java
│       │   │   ├── ProductCreateServlet.java
│       │   │   ├── ProductUpdateServlet.java
│       │   │   └── ProductDeleteServlet.java
│       │   ├── dao/               # Pattern DAO Générique
│       │   │   ├── GenericDAO.java
│       │   │   ├── GenericDAOImpl.java
│       │   │   ├── UserDAO.java
│       │   │   └── ProductDAO.java
│       │   ├── model/             # Entités JPA (MVC - Modèle)
│       │   │   ├── User.java
│       │   │   └── Product.java
│       │   ├── listener/
│       │   │   └── HibernateListener.java
│       │   └── util/
│       │       └── HibernateUtil.java
│       ├── resources/
│       │   └── hibernate.cfg.xml
│       └── webapp/                # Pages JSP (MVC - Vue)
│           ├── index.jsp
│           ├── header.jsp
│           ├── footer.jsp
│           ├── user-list.jsp
│           ├── user-form.jsp
│           ├── product-list.jsp
│           ├── product-form.jsp
│           ├── error.jsp
│           └── WEB-INF/
│               └── web.xml
└── pom.xml
```

---

## 🛠️ Technologies utilisées

| Technologie | Version | Rôle |
|---|---|---|
| Java | 11+ | Langage principal |
| Jakarta EE | 9.1 | API Servlet/JSP moderne |
| Hibernate ORM | 6.0 | Persistance des données |
| H2 Database | 2.1 | Base de données (par défaut) |
| MySQL | 8.x | Base de données (optionnel) |
| Apache Tomcat | 10.1 | Serveur d'application |
| Maven | 3.x | Gestion des dépendances |
| Bootstrap | 4.3 | Interface utilisateur |
| JSTL | 2.0 | Affichage dynamique JSP |

---

## ⚙️ Prérequis

- ✅ **JDK 11 ou supérieur**
- ✅ **Apache Tomcat 10.1.x** → [Télécharger](https://tomcat.apache.org/download-10.cgi)
- ✅ **Maven 3.x**
- ✅ **IntelliJ IDEA** (Community ou Ultimate)
```bash
java -version   # doit afficher 11+
mvn -version    # doit afficher 3.x
```

---

| Champ | Valeur |
|---|---|
| Tomcat server | Dossier Tomcat 10 |
| Deployment directory | `src/main/webapp` |
| Context path | `/inventory-management` |
| Server port | `8081` |

---

## 🗄️ Base de données

### Par défaut — H2 ✅
Aucune installation requise. La base se crée automatiquement au premier démarrage.

### Optionnel — MySQL
Dans `src/main/resources/hibernate.cfg.xml`, commente le bloc H2 et décommente le bloc MySQL :
```xml
<property name="hibernate.connection.driver_class">com.mysql.cj.jdbc.Driver</property>
<property name="hibernate.connection.url">jdbc:mysql://localhost:3306/inventorymanagement?createDatabaseIfNotExist=true</property>
<property name="hibernate.connection.username">root</property>
<property name="hibernate.connection.password">ton_mot_de_passe</property>
<property name="hibernate.dialect">org.hibernate.dialect.MySQLDialect</property>
```

---

## 🧩 Pattern DAO Générique
```java
// Interface générique
public interface GenericDAO<T, ID> {
    void save(T entity);
    void update(T entity);
    Optional<T> findById(ID id);
    List<T> findAll();
    void delete(ID id);
}

// UserDAO hérite de tout le CRUD automatiquement
public class UserDAO extends GenericDAOImpl<User, Long> {
    // + méthodes spécifiques : findByEmail()
}

// ProductDAO aussi
public class ProductDAO extends GenericDAOImpl<Product, Long> {
    // + méthodes spécifiques : findBySku(), findByNameContaining()
}
```

**Avantages :**
- 🔁 Réutilisation du code CRUD
- 🔧 Maintenance centralisée
- 📦 Facile d'ajouter de nouvelles entités
- 🔒 Type-safe grâce aux génériques Java

---

## 📸 Pages disponibles

| URL | Description |
|---|---|
| `/` | Page d'accueil |
| `/users` | Liste des utilisateurs |
| `/user-form` | Ajouter / Modifier un utilisateur |
| `/products` | Liste des produits + recherche |
| `/product-form` | Ajouter / Modifier un produit |

---

## 👨‍💻 Auteur

**Ayoube Moubssite**  
Projet réalisé dans le cadre d'un TP Jakarta EE — Hibernate — DAO Générique

---

> ⚠️ Ce projet utilise `jakarta.*` (Jakarta EE 9+) — Tomcat **10.x** obligatoire, Tomcat 9 non compatible.

package com.example.listener;

import com.example.util.HibernateUtil;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class HibernateListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        HibernateUtil.getSessionFactory();
        System.out.println("✅ Hibernate SessionFactory initialisée.");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        HibernateUtil.shutdown();
        System.out.println("✅ Hibernate SessionFactory fermée.");
    }
}

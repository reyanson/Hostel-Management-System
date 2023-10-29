package com.hostel_manage;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil {
    private static final SessionFactory sessionFactory;

    static {
        try {
            // Create the Configuration
            Configuration configuration = new Configuration();
            configuration.configure("hibernate.cfg.xml");

            // Build the StandardServiceRegistry
            StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                    .applySettings(configuration.getProperties())
                    .build();

            // Create the SessionFactory
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}


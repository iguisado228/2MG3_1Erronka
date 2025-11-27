package com.example.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class konexioa {

    private static final String URL = "jdbc:mysql://localhost:3306/nireDB";
    private static final String USER = "root";
    private static final String PASSWORD = "zurePasahitza";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}

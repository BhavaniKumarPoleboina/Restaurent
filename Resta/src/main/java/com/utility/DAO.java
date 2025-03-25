package com.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
    private static final String URL = "jdbc:mysql://localhost:3306/restaurent";
    private static final String USER = "root";
    private static final String PASSWORD = "bhavani6305580326";

    public Connection getConnections() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return con;
    }
}

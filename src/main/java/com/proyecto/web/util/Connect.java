/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.proyecto.web.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {


// PROD    
    private static final String URL = "jdbc:sqlserver://10.216.43.12:1433;databaseName=master_all";
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String USUARIO = "sa";
    private static final String PASS = "J@fra1975";

    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static Connection con() {
        try {
            return DriverManager.getConnection(URL, USUARIO, PASS);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

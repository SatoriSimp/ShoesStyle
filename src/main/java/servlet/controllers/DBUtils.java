package servlet.controllers;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Dell
 */
public class DBUtils implements Serializable {
    public static Connection MakeConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShoesStylizing;instance=SQLSERVER";
            Connection con = DriverManager.getConnection(url, "sa", "12345");
            return con;
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }     
}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

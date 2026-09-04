package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class connection {

    public static Connection takeconnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/welovesoftdrinks",
                "root",
                ""
            );

        } catch (Exception e) {

            e.printStackTrace();
            return null;

        }
    }
}
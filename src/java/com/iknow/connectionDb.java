package com.iknow;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connectionDb {
    private final static String db_url = "";
    private final static String db_base = "";
    private final static String db_user = "";
    private final static String db_pass = "";
    
    public static Connection connect() throws SQLException, ClassNotFoundException{
        Connection con = null;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://" + db_url + "/" + db_base + "?user=" + db_user + "&password=" + db_pass);
        return con;
    }
}

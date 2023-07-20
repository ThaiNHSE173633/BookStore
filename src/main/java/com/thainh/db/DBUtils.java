package com.thainh.db;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBUtils implements Serializable {

    public static Connection makeConnection() throws NamingException {
        try {
            Context ctx = new InitialContext();
            Context envCtx = (Context) ctx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("DBConfig");
            Connection con = ds.getConnection();
            return con;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
}

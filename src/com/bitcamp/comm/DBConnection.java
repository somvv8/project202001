package com.bitcamp.comm;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnection {
	private static DBConnection instanse=new DBConnection();
	public static DBConnection getInstanse() 
	{
		return instanse;
	}
	private DBConnection () {}
	
	public Connection getConnection() 
			throws NamingException, SQLException
	{
		Context initctx=new InitialContext();
		DataSource ds=(DataSource)initctx.lookup(
			"java:comp/env/jdbc/bitcamp");
		Connection conn=ds.getConnection();
		return conn;
	}
}

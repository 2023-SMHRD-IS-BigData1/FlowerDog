package com.fd.db;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

@WebServlet("/SqlSessionmanager")
public class SqlSessionmanager extends HttpServlet {
	private static SqlSessionFactory sqlSessionFactory;
	
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
	
	static {		
		try {
			String resource = "com/fd/db/mybatis-config.xml";
			InputStream inputStream;
			inputStream = Resources.getResourceAsStream(resource);
		    sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
	}

}

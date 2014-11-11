package com.yzw.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * ���ݿ⹤����
 */
public class BaseDao {
	//���ݿ������ַ���
	private static String driverStr = "oracle.jdbc.driver.OracleDriver";
	//����URL�ַ���
	private static String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
	//���ݿ��û���
	private static String user = "scott";
	//����
	private static String pwd = "scott";
	
	/**
	 * ��ȡ���ݿ����Ӷ���
	 * @return ���Ӷ���
	 */
	public static Connection getConnection() {
		Connection conn = null;
		//��ȡ���Ӳ������쳣
		try {
			Class.forName(driverStr);
			conn = DriverManager.getConnection(url, user, pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;	//�������Ӷ���
	}
	
	/**
	 * �ر����ݿ�����
	 * @param conn ���ݿ�����
	 * @param stmt ����
	 * @param rs �����
	 */
	public static void closeAll(Connection conn, Statement stmt, ResultSet rs) {
		//�ر���Դ
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
	}
}
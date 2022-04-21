package com.test;

import java.sql.Connection;

import com.util.DBConn;

public class Test006
{
	public static void main(String[] args)
	{
		try
		{
			Connection conn = DBConn.getConnection();
			if (conn == null)
			{
				System.out.println("데이터베이스 연결 실패~!!");
			}
			else 
			{
				System.out.println("데이터베이스 연결 성공~!!!");
			}
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		finally
		{
			try
			{
				DBConn.close();
			} catch (Exception e2)
			{
				System.out.println(e2.toString());
			}
		}
		
		
		
	}
}

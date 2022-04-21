/* =================
      DBConn.java
================= */
// 프로그램 - DB 와 연결하는 객체를 만듦
// 리소스 소모가 심한 파트 : 연결하는 파트

// ※ 싱글톤(singleton) 디자인(설계적) 패턴을 이용한 Database 연결 객체 생성 전용 클래스
//    → DB 연결 과정이 가장 부하가 크기 때문에
//       한 번 연결된 객체를 계속 사용하는 것이 좋지 않을까...

//  DBConn / DBConnBackup 은 외우자

package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn
{
	// 변수 선언
	private static Connection dbConn;
	
	// 메소드 정의 → 연결
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		// 한 번 연결된 객체를 계속 사용
		// 즉, 연결되지 않은 경우에만 연결을 시도
		// → 싱글톤(디자인 패턴)
		// url 은 선언만하고 사용하지 않으면 노란 경고메세지 뜸..
		if (dbConn == null)
		{
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			// -- localhost 는 오라클 서버의 ip 주소를 기재하는 부분
			//    『1521』 은 오라클 리스너 Port Number
			//    『xe』는 오라클 SID(Express Edition 의 SID 는 xe)
			
			String user = "scott";
			// -- 오라클 사용자 계정 이름
			String pwd = "tiger";
			// -- 오라클 사용자 계정 암호
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// -- OracleDriver 클래스에 대한 객체 생성(클래스 찾아줘~)
			
			dbConn = DriverManager.getConnection(url, user, pwd);
			// -- 오라클서버 실제 연결
			//    갖고있는 인자값(매개변수)은 오라클주소, 계정명, 패스워드

		}
		
		return dbConn;
		// -- 구성된 연결 객체 반환
	}
	
	// getConnection() 메소드의 오버로딩 → 연결
	public static Connection getConnection(String url, String user, String pwd) throws ClassNotFoundException, SQLException
	{
		if( dbConn == null )
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbConn = DriverManager.getConnection(url, user, pwd);
			
		}
		return dbConn;
	}
	
	
	public static void close() throws SQLException
	{
		// dbCOnn 변수(멤버 변수) 는
		// Database 가 연결된 상태일 경우 Connection 을 갖는다.
		// 연결되지 않은 상태라면.. null 인 상태가 된다.
		
		if (dbConn != null)
		{
			// 연결 객체 dbConn 의 is Closed() 메소드를 통해 연결 상태 확인
			// 연결이 닫혀있는 경우 true 반환
			// 연결이 닫혀있지 않은 경우 false 반환
			if (!dbConn.isClosed())
			{
				dbConn.close();
				//-- 연결 객체의 close() 메소드 호출을 통해 연결 종료~!!
			}
		}
		
		dbConn = null;
		// -- 연결 객체 초기화
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}


















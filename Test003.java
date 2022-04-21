/*=========================
  Test003.java
  - 데이터베이스 연결 실습
  - 데이터 입력 실습
 =========================*/

package com.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.util.DBConn;

public class Test003
{
	public static void main(String[] args) throws ClassNotFoundException, SQLException
	{
		Connection conn = DBConn.getConnection();
		
		if (conn == null)
		{
			System.out.println("데이터베이스 연결 실패~!!!");
			System.exit(0);
		}
		
		// System.out.println("데이터베이스 연결 성공~!!!");
		// -- 연결이 된 상태의 구문실행 ↓↓↓↓	
		
		try
		{
			// 작업 객체 구성(준비)
			Statement stmt = conn.createStatement();
			
			// ※ 데이터 입력 쿼리 실행 과정
			//    한번 실행하면 다시 실행하지 못하는 상황이다.
			//    기본키 제약조건이 설정되어 있으므로
			//    동일한 키 값이 중복될 수 없기 때문이다.
			
			// 쿼리문 구성(준비)
			String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(2, '김상기', '010-5693-4223')";
			//-- 주의. 쿼리문 끝에 『;』붙이지 않는다.
			//   주의. 자바에서 실행한 DML 구문은 내부적으로 자동 COMMIT 된다.
			//   주의. 오라클에서 트랜잭션 처리가 끝나지 않으면(COMMIT되지않은상태로 처리할 구문이 남아있다면)
			//         자바에서 데이터 액션 처리가 이루어지지 않는다.
			
			// 자주쓰이는 메소드 2개
			/*
			   ㄱ. stmt.executeQuery()
			       - select 문을 보낼 때 Query 사용
			   ㄴ. stmt.executeUpdate()
			       - 데이터구조 바뀔때 Update 사용
			*/
			
			// stmt.executeUpdate(sql);
			// ↑ 해당 구문 자체는 Update 된 행의 갯수를 반환
			//    1개 행 을 삽입하여 성공시키면 1을 반환 
			
			int result = stmt.executeUpdate(sql);
			
			if (result > 0)
			{
				System.out.println("데이터 입력 성공!");
			} 
			else
			{
				System.out.println("입력 실패 ~ ㅠㅠ");
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		DBConn.close();
		//-- 리소스 반납(연결 종료)
		
		
		// ---------------------------------------------------------------------------------------------
		// --==>> 데이터 입력 성공!

		
		
		
		
		
		
	}
}

















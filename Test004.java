/* ================
   Test004.java 
=============== */

/*
 ○ JDBC 프로그램의 작성
    1. 드라이버 인스턴스 생성
       사용할 파일들(데이터베이스와 연결 과정에서 사용될 파일들)이 있는지 확인한다.
       이 과정에서 굳이 인스턴스를 생성하지 않고,
       드라이버가 있는지만 확인하더라도
       프로그램을 실행하는 데에는 지장이 없다.
       
       ※ 드라이버 클래스를 찾는 방법
          『Class』라는 클래스의 『forName()』메소드를 사용
          이 메소드는 매개변수로 넘겨받은 이름의 클래스를 찾아주는 역할을 수행하며
          해당 클래스를 찾지 못할 경우 『ClassNotFoundException』예외를
          발생시키게 된다.
          
    2. 연결 객체 생성
       (Class.forName() 을 활용하여..) 찾은 드라이버 클래스를 가지고
       설치된 데이터베이스 서버와 연결하는 Connection 객체를 생성한다.
       
       ※ Connection 객체는 DriverManager 클래스의
         『getConnection()』이라는 static 메소드로 생성한다.
          예외는 데이터베이스 서버와 연결하는 과정에서 문제가 있을 경우 발생하게 되며
          『SQLException』 예외를 발생시키게 된다.
    3. 작업 객체 생성
       연결된 포트를 통해 질의문을 보낼 수 있도록 도와주는 객체를 생성한다.
       자바에서는 크게 세 가지 방법으로 질의를 처리한다.
       
       1) Statement 객체 생성
          정적 질의를 처리할 때 주로 사용
          
       2) PreparedStatement 객체 생성
          동적 질의를 처리할 때 주로 사용
                                     
       3) CallableStatement 객체 생성
          프로시저나 함수를 호출할 수 있도록 사용                    
                           
                                   
 */
package com.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import com.util.DBConn;

public class Test004
{
	public static void main(String[] args) throws ClassNotFoundException, SQLException
	{
		Scanner sc = new Scanner(System.in);
		
		Connection conn = DBConn.getConnection();
		
		do
		{
			System.out.print("번호를 입력하세요(-1 종료) : ");
			String sid = sc.next();
			
			// 반복문의 조건을 무너뜨리는 코드 구성
			if (sid.equals("-1"))
				break;
			
			System.out.print("이름을 입력하세요 : ");
			String name = sc.next();
			
			System.out.print("전화번호를 입력하세요 : ");
			String tel = sc.next();
			
			if (conn != null)
			{
				System.out.println("데이터베이스 연결 성공~!!!");
				
				try
				{
					Statement stmt = conn.createStatement();
					
					String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(%s, '%s', '%s')", sid, name, tel);
					// 데이터베이스로부터 질의 결과를 가져와야 하는 경우
					// → 『executeQuery()』메소드 사용
					// 특정 내용을 데이터베이스에 적용해야 하는 경우
					// → 『executeUpdate()』 메소드 사용
					
					int result = stmt.executeUpdate(sql);
					// -- executeUpdate() 메소드는 적용된 행의 갯수를 반환
					
					if (result > 0)
						System.out.println("회원정보가 입력되었습니다.");
									
				} catch (Exception e)
				{
					System.out.println(e.toString());
				}
			}
			else
			{
				System.out.println("데이터베이스 연결 실패~!!");
				break;
			}// end of if
			
		} while (true);	// end of do-while
		
		DBConn.close();
		
		System.out.println("데이터베이스 연결 닫힘~!!!");
		System.out.println("프로그램 종료됨~!!");
		
		sc.close();	// ??? Scanner 리소스 열려있어서 닫아줘야돼나보다.
		
	}// end of main()
	
	
}
// 실행 결과
/*
번호를 입력하세요(-1 종료) : 3
이름을 입력하세요 : 김정용
전화번호를 입력하세요 : 010-3333-3333
데이터베이스 연결 성공~!!!
회원정보가 입력되었습니다.
번호를 입력하세요(-1 종료) : 4
이름을 입력하세요 : 오이삭
전화번호를 입력하세요 : 010-4444-4444
데이터베이스 연결 성공~!!!
회원정보가 입력되었습니다.
번호를 입력하세요(-1 종료) : 5
이름을 입력하세요 : 김태형
전화번호를 입력하세요 : 010-5555-5555
데이터베이스 연결 성공~!!!
회원정보가 입력되었습니다.
번호를 입력하세요(-1 종료) : -1
데이터베이스 연결 닫힘~!!!
프로그램 종료됨~!!
*/
























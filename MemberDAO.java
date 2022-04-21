/* ==================
   MemberDAO.java 
==================*/

// 데이터베이스에 액세스하는 기능
// → DBConn 활용(전담 계층)

// 데이터를 입력하는 기능 → insert

// 인원 수 확인하는 기능
// 즉, 대상 테이블(TBL_MEMBER)의 레코드 카운팅 기능 → select

// 전체 리스트를 조회하는 기능
// 즉, 대상 테이블(TBL_MEMBER)의 데이터를 조회하는 기능 → select
 
package com.test;


import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.DBConn;

// Data Access Object = DAO
public class MemberDAO  
{
	// 주요 속성 구성 → DB 연결 객체
	private Connection conn;

	// getter / setter 구성 → 필요없음
	/*
	public Connection getConn()
	{
		return conn;
	}

	public void setConn(Connection conn)
	{
		this.conn = conn;
	}
	*/

	// DB연결은 모든 기능의 대전제이므로 생성자로 만들어버리기(사용자정의)
	public MemberDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 메소드 정의 → 데이터를 입력하는 기능 → insert
	public int add(MemberDTO dto) throws SQLException
	{
	      // 반환할 결과값을 담아낼 변수 (적용될 행의 갯수)
	      int result = 0;
	      // 작업 객체 생성
	      Statement stmt = conn.createStatement();
	      
	      // 쿼리문 준비(insert)
	      String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
	                            + " VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')", dto.getName(), dto.getTel());
	   
	      // 작업 객체를 활용하여 쿼리문 실행(전달)
	      result = stmt.executeUpdate(sql);
	      
	      // 사용한 리소스 반납
	      stmt.close();
	       
	      // 최종 결과값 반납 
	      return result;

		
	} // end of add()

	public int count() throws SQLException
	{
		// 결과값으로 반환하게 될 변수 선언 및 초기화
		int result = 0;
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		
		// 생성된 작업 객체를 활용하여 쿼리문 실행 → select 
		// → executeQuery() → ResultSet 반환 → 일반적으로 반복문 구성		

		ResultSet rs = stmt.executeQuery(sql);
		
		// 반복문 구성을 통한 ResultSet 처리하기 → 결과값 수신
		while (rs.next())		// if (rs.next()) 해도 됀다.. 1번만 돌기때문에
		{
			// 변수에 결과집합 담기
			result = rs.getInt("COUNT");	// = rs.getInt(1); 
											//             -  ->컬럼인덱스넘기기
											// 컬럼인덱스보다 컬럼명을명시하는게
											// 더 바람직하다.. 코드의 이해를 통해
		}
		
		// 사용한 리소스 반납
		rs.close();
		stmt.close();

		// 최종 결과값 반환
		return result;
		
	} // end of count()
	
	
	// 메소드 정의 → 전체 리스트를 조회하는 기능 → select
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		// 결과값으로 반환할 변수 선언 및 초기화
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비 → select
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		
		//  생성된 작업객체를 활용하여 쿼리문 실행 → select → executeQuery()
		//  → ResultSet 반환 → 일반적으로 반복 처리
		ResultSet rs = stmt.executeQuery(sql);
		
		// ResultSet 처리 → 일반적 반복문 활용
		while (rs.next())
		{
			// dto(SID, NAME, TEL) 타입으로 DB에있는 정보를 담을 그릇만들기
			MemberDTO dto = new MemberDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));			
			
			result.add(dto);
			
		}
		
		// 리소스 반납
		rs.close();
		stmt.close();
		
		// 최종 결과값 반환
		return result;
		
	} // end of lists()
	
	
	// 메소드 정의 → 종료메소드
	public void close() throws SQLException
	{
		// 주의 check~!!
		//conn.close();
		
		DBConn.close();
	}
	
	
	
}


























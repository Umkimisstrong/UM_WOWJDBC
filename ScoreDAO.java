package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

// 1. 입력기능 메소드	         add()
// 2. 전체 인원수 세는 메소드    count()
// 3. 전체 조회 메소드           show()
// 4. 대전제 - DBConn 연결 → 생성자
// 5. DBConn 종료 메소드
public class ScoreDAO
{
	private static Connection conn;
	
	// 생성자
	public ScoreDAO()
	{
		conn = DBConn.getConnection();
	}
	
	// 종료
	public void close()
	{
		DBConn.close();
	}
	
	// 데이터 입력 메소드
	public int add(ScoreDTO dto) throws SQLException
	{
		// 변수 선언
		int result = 0;
		
		// 작업객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) "
                      				+ "VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)", dto.getName(), dto.getKor(), dto.getEng(), dto.getMat());
		
		// 작업객체에 담아 쿼리문 전달 → result 
		result = stmt.executeUpdate(sql);
		
		// 사용한 리소스 반납
		stmt.close();
		return result;
	}
	
	// 인원 수 세는 메소드
	public int count() throws SQLException
	{
		int result = 0;
		
		// 작업객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		
		// 작업객체에 담아 쿼리문 전달 → Result
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	public ArrayList<ScoreDTO> show() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, KOR, ENG, MAT FROM TBL_SCORE ORDER BY SID";
		
		// 쿼리에대한 결과를 결과집합 객체에 담기
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			
			result.add(dto);
		}
		
		// 리소스 반납
		rs.close();
		stmt.close();
		
		// 결과값 반환
		return result;
		
 	}
	
	
	
}

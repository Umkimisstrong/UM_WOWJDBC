/* ==================
   MemberDTO.java 
================== */


package com.test;
// getter setter 구성
// 단축키 alt + shift + s → r

// Data Transfer Object
public class MemberDTO
{
	
	private String sid, name, tel;

	public String getSid()
	{
		return sid;
	}

	public void setSid(String sid)
	{
		this.sid = sid;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}


}

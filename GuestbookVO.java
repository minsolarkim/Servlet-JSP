package com.bc.mybatis;

public class GuestbookVO {
	
	private String idx; //sql에서 number이지만 연산을 할 건 아니기 때문에 다 String으로 받을 거임
	private String name;
	private String subject;
	private String content;
	private String email;
	private String pwd;
	private String regdate;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	//Ctrl + shift + y 누르면 소문자로 다 바뀜 --> 복사 해서 소문자로 바꿔서 한 줄에 선언해줘도 되긴 함 (권장x)
//	private String idx, name, subject, content, email, pwd, regdate;
	
	@Override
	public String toString() {
		return "GuestbookVO [idx=" + idx + ", name=" + name + ", subject=" + subject + ", content=" + content
				+ ", email=" + email + ", pwd=" + pwd + ", regdate=" + regdate + "]";
	}
	
	
	
}

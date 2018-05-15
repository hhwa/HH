package imageboard.gallery;

import java.sql.Timestamp;

public class Theme {
	private int id;	//글 번호
	private int groupId; //메인과 답변글을 묶어주는 그룹 번호
	private int orderNo;	//글 순서
	private int levels;		//답변글의 레벨
	private int parentId;	//답변글의 상위글의 글 번호
	private Timestamp register;	//작성날짜
	private String name;	//작성자이름
	private String email;	//이메일
	private String image;	//업로드 이미지파일 이름
	private String password;	//글 비밀번호
	private String title;	//글 제목
	private String content;	//글 내용
	private String comment;//댓글
	private int comment_num;//댓글 번호
	private String writer;//댓글 작성자
	private String cmtpassword;//댓글 비밀번호
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCmtpassword() {
		return cmtpassword;
	}
	public void setCmtpassword(String cmtpassword) {
		this.cmtpassword = cmtpassword;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGroupId() {
		return groupId;
	}
	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getLevels() {
		return levels;
	}
	public void setLevels(int levels) {
		this.levels = levels;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public Timestamp getRegister() {
		return register;
	}
	public void setRegister(Timestamp register) {
		this.register = register;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}

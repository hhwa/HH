package imageboard.gallery;

import java.sql.Timestamp;

public class Theme {
	private int id;	//�� ��ȣ
	private int groupId; //���ΰ� �亯���� �����ִ� �׷� ��ȣ
	private int orderNo;	//�� ����
	private int levels;		//�亯���� ����
	private int parentId;	//�亯���� �������� �� ��ȣ
	private Timestamp register;	//�ۼ���¥
	private String name;	//�ۼ����̸�
	private String email;	//�̸���
	private String image;	//���ε� �̹������� �̸�
	private String password;	//�� ��й�ȣ
	private String title;	//�� ����
	private String content;	//�� ����
	private String comment;//���
	private int comment_num;//��� ��ȣ
	private String writer;//��� �ۼ���
	private String cmtpassword;//��� ��й�ȣ
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

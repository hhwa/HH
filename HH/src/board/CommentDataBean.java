package board;
import java.sql.Timestamp;
public class CommentDataBean {

	private int comment_num; //댓글의글번호
	private int content_num; //게시글번호
	private String commenter;//작성자
	private String commentt;//댓글
	private String passwd;//ㅂㅣ밀번호
	private Timestamp reg_date;
	private String ip;
	private int cm_ref;
	private int cm_re_step;
	private int cm_re_level;
	public int getCm_ref() {
		return cm_ref;
	}
	public void setCm_ref(int cm_ref) {
		this.cm_ref = cm_ref;
	}
	public int getCm_re_step() {
		return cm_re_step;
	}
	public void setCm_re_step(int cm_re_step) {
		this.cm_re_step = cm_re_step;
	}
	public int getCm_re_level() {
		return cm_re_level;
	}
	public void setCm_re_level(int cm_re_level) {
		this.cm_re_level = cm_re_level;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getContent_num() {
		return content_num;
	}
	public void setContent_num(int content_num) {
		this.content_num = content_num;
	}
	public String getCommenter() {
		return commenter;
	}
	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}
	public String getCommentt() {
		return commentt;
	}
	public void setCommentt(String commentt) {
		this.commentt = commentt;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
}

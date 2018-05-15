package member;

public class RegisterBean {

	private String id;
	private String passwd;
	private String repasswd;
	private String name;
	private String email;
	private String tel;
	private String birth_year;
	private String birth_month;
	private String birth_day;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getRepasswd() {
		return repasswd;
	}

	public void setRepasswd(String repasswd) {
		this.repasswd = repasswd;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getBirth_year() {
		return birth_year;
	}

	public void setBirth_year(String birth_year) {
		this.birth_year = birth_year;
	}

	public String getBirth_month() {
		return birth_month;
	}

	public void setBirth_month(String birth_month) {
		if (Integer.parseInt(birth_month) < 10) {
			this.birth_month = "0" + birth_month;
		} else {
			this.birth_month = birth_month;
		}
	}

	public String getBirth_day() {
		return birth_day;
	}

	public void setBirth_day(String birth_day) {
		if (Integer.parseInt(birth_day) < 10) {
			this.birth_day = "0" + birth_day;
		} else {
			this.birth_day = birth_day;
		}
	}
}

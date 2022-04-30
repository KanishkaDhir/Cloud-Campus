package beans;

public class Registration {

    Integer RegistrationID;
    String UserID,Password,InstituteName,Address,City,EmailID,SecurityQuestion,Answer,Code;
	public Registration(){}
	public Registration(Integer RegistrationID,String UserID,String Password,String InstituteName,String Address,String City,String EmailID,String SecurityQuestion,String Answer,String Code )
	{
		super();
		this.RegistrationID=RegistrationID;
                this.UserID=UserID;
                this.Password=Password;
                this.InstituteName=InstituteName;
                this.Address=Address;
                this.City=City;
                this.EmailID=EmailID;
                this.SecurityQuestion=SecurityQuestion;
                this.Answer=Answer;
                this.Code=Code;
	}
  /*  private int RegistrationID;
    private String UserID;
    private String Password;
    private String InstituteName;
    private String Address;
    private String City;
    private String EmailID;
    private String SecurityQuestion;
    private String Answer;
     private String Code;
*/
    
   

    public int getRegistrationID() {
        return RegistrationID;
    }

    public void setRegistrationID(int registrationID) {
        RegistrationID = registrationID;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String userID) {
        UserID = userID;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getInstituteName() {
        return InstituteName;
    }

    public void setInstituteName(String instituteName) {
        InstituteName = instituteName;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String city) {
        City = city;
    }

    public String getEmailID() {
        return EmailID;
    }

    public void setEmailID(String emailID) {
        EmailID = emailID;
    }

    public String getSecurityQuestion() {
        return SecurityQuestion;
    }

    public void setSecurityQuestion(String securityQuestion) {
        SecurityQuestion = securityQuestion;
    }
    public String getAnswer() {
        return Answer;
    }

    public void setAnswer(String answer) {
        Answer = answer;
    }

    public String getCode() {
        return Code;
    }

    public void setCode(String code) {
        Code = code;
    }
}

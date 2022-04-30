package beans;

public class Notice {

    private int NoticeId;
    private String Subject;
    private String Date;
    private String Description;
    private int FacultyId;
    private byte Status;
    private String FacultyName;

    public String getFacultyName() {
        return FacultyName;
    }

    public void setFacultyName(String FacultyName) {
        this.FacultyName = FacultyName;
    }

    public int getNoticeId() {
        return NoticeId;
    }

    public void setNoticeId(int NoticeId) {
        this.NoticeId = NoticeId;
    }

    public String getSubject() {
        return Subject;
    }

    public void setSubject(String Subject) {
        this.Subject = Subject;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getFacultyId() {
        return FacultyId;
    }

    public void setFacultyId(int FacultyId) {
        this.FacultyId = FacultyId;
    }

    public byte getStatus() {
        return Status;
    }

    public void setStatus(byte Status) {
        this.Status = Status;
    }
    
}

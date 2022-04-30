package beans;

public class Events {

    private int EventId;
    private String EventName;
    private String Date;
    private String Venue;
    private int RefId;
    private String RefType;
    private String Category;
    private String Description;
    private String ImageName;
    private Byte Status;
    private String FacultyName;
    private Byte IsOpened;

    public Byte getIsOpened() {
        return IsOpened;
    }

    public void setIsOpened(Byte IsOpened) {
        this.IsOpened = IsOpened;
    }

    public String getFacultyName() {
        return FacultyName;
    }

    public void setFacultyName(String FacultyName) {
        this.FacultyName = FacultyName;
    }

    public int getEventId() {
        return EventId;
    }

    public void setEventId(int EventId) {
        this.EventId = EventId;
    }

    public String getEventName() {
        return EventName;
    }

    public void setEventName(String EventName) {
        this.EventName = EventName;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    public String getVenue() {
        return Venue;
    }

    public void setVenue(String Venue) {
        this.Venue = Venue;
    }

    public int getRefId() {
        return RefId;
    }

    public void setRefId(int RefId) {
        this.RefId = RefId;
    }

    public String getRefType() {
        return RefType;
    }

    public void setRefType(String RefType) {
        this.RefType = RefType;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getImageName() {
        return ImageName;
    }

    public void setImageName(String ImageName) {
        this.ImageName = ImageName;
    }

    public Byte getStatus() {
        return Status;
    }

    public void setStatus(Byte Status) {
        this.Status = Status;
    }
    
}

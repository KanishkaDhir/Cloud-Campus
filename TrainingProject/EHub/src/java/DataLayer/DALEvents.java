package DataLayer;

import beans.Events;
import beans.Faculties;
import beans.Students;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DALEvents extends DBOperations {
    
    public void addEvent(beans.Events r)
    {
        createConnection();
        try{
            PreparedStatement ps=con.prepareStatement("insert into Events values(?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, r.getEventName());
            ps.setString(2, r.getDate());
            ps.setString(3, r.getVenue());
            ps.setInt(4, r.getRefId());
            ps.setString(5, r.getRefType());
            ps.setString(6, r.getCategory());
            ps.setString(7, r.getDescription());
            ps.setString(8, r.getImageName());
            ps.setByte(9, r.getStatus());
            ps.setByte(10, r.getIsOpened());
            ps.executeUpdate();
        }//try
        catch(Exception ex){}//catch
    closeConnection();
    }//function

     public ArrayList<beans.Events> getEvents(int regid)
    {
        ArrayList<beans.Events> AC = new ArrayList<Events>();
        
        createConnection();
        
        try
        {
            PreparedStatement ps = con.prepareStatement("select EventId,EventName,Convert(varchar,Date,103) as [Date],"
                    + "Venue,Category,Description,ImageName from events where RefId=? and Status=1");
            ps.setInt(1, regid);
            ResultSet rs = ps.executeQuery();
            
            
            beans.Events obj;
            
            while(rs.next())
            {
                obj = new beans.Events();
                obj.setEventId(rs.getInt("EventId"));
                obj.setEventName(rs.getString("EventName").trim());
                obj.setDate(rs.getString("Date").trim());
                obj.setVenue(rs.getString("Venue").trim());
                obj.setCategory(rs.getString("Category").trim());
                obj.setDescription(rs.getString("Description").trim());
                obj.setImageName(rs.getString("ImageName").trim());
                

                AC.add(obj);
            }
        }
        catch(Exception ex)
        {
            
        }
        
        closeConnection();
        
        return AC;
    }//

      public ArrayList<beans.Events> getNewEvents(int regid)
    {
        ArrayList<beans.Events> AC = new ArrayList<Events>();
        
        createConnection();
        
        try
        {
            PreparedStatement ps = con.prepareStatement("select EventId,EventName,Convert(varchar,Date,103) as [Date],"
                    + "Venue,Category,Description,ImageName from events where RefId=? and Status=0");
            ps.setInt(1, regid);
            ResultSet rs = ps.executeQuery();
            
            
            beans.Events obj;
            
            while(rs.next())
            {
                obj = new beans.Events();
                obj.setEventId(rs.getInt("EventId"));
                obj.setEventName(rs.getString("EventName").trim());
                obj.setDate(rs.getString("Date").trim());
                obj.setVenue(rs.getString("Venue").trim());
                obj.setCategory(rs.getString("Category").trim());
                obj.setDescription(rs.getString("Description").trim());
                obj.setImageName(rs.getString("ImageName").trim());
                

                AC.add(obj);
            }
        }
        catch(Exception ex)
        {
            
        }
        
        closeConnection();
        
        return AC;

    }//function

       public ArrayList<beans.Events> getCurrentEvents(int regid)
    {
        ArrayList<beans.Events> AC = new ArrayList<Events>();
        
        createConnection();
        
        try
        {
            PreparedStatement ps = con.prepareStatement("select EventId,EventName,Convert(varchar,Date,103) as [Date],Venue,"
                    + "Category,Description,Name from events,faculties where refid in(select facultyid from faculties where "
                    + "departmentid in(select departmentid from\n" +
                    "departments where registrationid=(select registrationid from departments where "
                    + "departmentid=(select departmentid from faculties where facultyid=?)))) and status=0 and "
                    + "events.refid=faculties.facultyid");
            ps.setInt(1, regid);
            ResultSet rs = ps.executeQuery();
            
            
            beans.Events obj;
            
            while(rs.next())
            {
                obj = new beans.Events();
                obj.setEventId(rs.getInt("EventId"));
                obj.setEventName(rs.getString("EventName").trim());
                obj.setDate(rs.getString("Date").trim());
                obj.setVenue(rs.getString("Venue").trim());
                obj.setCategory(rs.getString("Category").trim());
                obj.setDescription(rs.getString("Description").trim());
                obj.setFacultyName(rs.getString("Name").trim());

                AC.add(obj);
            }
        }
        catch(Exception ex)
        {
            
        }
        
        closeConnection();
        
        return AC;
    }//function

      
      
      public ArrayList<beans.Events> getStudentEvents(int regid)
    {
        ArrayList<beans.Events> AC = new ArrayList<Events>();
        
        createConnection();
        
        try
        {
            PreparedStatement ps = con.prepareStatement("select EventId,EventName,Convert(varchar,Date,103) as [Date],Venue,"
                    + "RefId,Category,Description,ImageName,IsOpened,Name from events,faculties where refid in"
                    + "(select facultyid from faculties where departmentid in(select departmentid from "
    +"departments where registrationid=(select registrationid from departments where departmentid=(select departmentid from"
                    + " faculties where facultyid=?)))) and status=0 and events.refid=faculties.facultyid");
            ps.setInt(1, regid);
            ResultSet rs = ps.executeQuery();
            
            
            beans.Events obj;
            
            while(rs.next())
            {
                obj = new beans.Events();
                obj.setEventId(rs.getInt("EventId"));
                obj.setEventName(rs.getString("EventName").trim());
                obj.setDate(rs.getString("Date").trim());
                obj.setVenue(rs.getString("Venue").trim());
                obj.setRefId(rs.getInt("RefId"));
                obj.setCategory(rs.getString("Category").trim());
                obj.setDescription(rs.getString("Description").trim());
                obj.setImageName(rs.getString("ImageName").trim());
                obj.setIsOpened(rs.getByte("IsOpened"));
                obj.setFacultyName(rs.getString("Name"));

                AC.add(obj);
            }
        }
        catch(Exception ex)
        {
            
        }
        
        closeConnection();
        
        return AC;
    }//function
       
      
      public void deleteEvent(int factid)
    {
        createConnection();
        try{
            PreparedStatement ps=con.prepareStatement("delete from Events where EventId=?");
            ps.setInt(1, factid);

            ps.executeUpdate();
            
        }
        catch(Exception ex)
        {}
        closeConnection();
    }//function

public beans.Events getEventDetails(int eventid)
{
   beans.Events r=new Events();
    createConnection();
    try{
        PreparedStatement ps=con.prepareStatement("select EventName,Convert(varchar,Date,103) as [Date],Venue,RefId,Category,"
                + "Description,ImageName,IsOpened,Name from events,faculties "
                + "where eventid=? and Events.RefId=Faculties.facultyid");
        ps.setInt(1, eventid);
        ResultSet rs=ps.executeQuery();
        while(rs.next())
            {
            r.setEventName(rs.getString("EventName").trim());
            r.setDate(rs.getString("Date").trim());
            r.setVenue(rs.getString("Venue").trim());
            r.setRefId(rs.getInt("RefId"));
            r.setCategory(rs.getString("Category").trim());
            r.setDescription(rs.getString("Description").trim());
            r.setImageName(rs.getString("ImageName").trim());
            r.setIsOpened(rs.getByte("IsOpened"));
            r.setFacultyName(rs.getString("Name").trim());
            }///while
        }
    catch(Exception ex)
    {}//catch
   return r;
}//function
    
public void updateEvent(beans.Events r)

{
    createConnection();
    try{
        PreparedStatement ps=con.prepareStatement("update events set EventName=?,Date=?,Venue=?,Category=?,Description=?,ImageName=? where EventId=?");
        ps.setString(1, r.getEventName());
        ps.setString(2, r.getDate());
        ps.setString(3, r.getVenue());
        ps.setString(4, r.getCategory());
        ps.setString(5, r.getDescription());
        ps.setString(6, r.getImageName());
        ps.setInt(7, r.getEventId());
        ps.executeUpdate();
        
    }
    catch(Exception ex)
    {
    }//catch
}//function
public void hideEvent(int eventid)
        {
            createConnection();
            try{
                PreparedStatement ps=con.prepareStatement("Update events set status=1 where eventid=?");
                ps.setInt(1, eventid);
                ps.executeUpdate();
            }
            catch(Exception ex)
                    {}
        }//function
    public void registerEvent(int stdid,int factid,int eventid)
    {
        
        createConnection();
        try{
            PreparedStatement ps=con.prepareStatement("insert into registeredstudents values(?,?,?)");
            ps.setInt(1, stdid); 
            ps.setInt(2, factid);
            ps.setInt(3, eventid);
            ps.executeUpdate();
        }
        catch(Exception ex){}
    }//function
    
public boolean checkRegistration(int stdid,int eventid)
{
    boolean b=true;
    createConnection();
    try{
        PreparedStatement ps=con.prepareStatement("select * from registeredstudents where studentid=? and eventid=?");
        ps.setInt(1, stdid);
        ps.setInt(2, eventid);
        ResultSet rs=ps.executeQuery();
        if(rs.next()==true)
        {
            b=false;
        }
    }
    catch(Exception ex){}
    return b;
}//function
 public ArrayList<beans.Events> registeredEvents(int stid)
    {
        ArrayList<beans.Events> AC = new ArrayList<Events>();
        beans.Events r;
    createConnection();
    try{
        PreparedStatement ps=con.prepareStatement("select EventName,Convert(varchar,Date,103) as Date,Venue,Description,Name from Events,faculties where EventId in "
                + "(select eventid from registeredstudents where studentid=?)\n" +
" and Events.refid=faculties.facultyid and Status=0");
        ps.setInt(1, stid);
        ResultSet rs=ps.executeQuery();
        while(rs.next())
        {
            r=new Events();
            r.setEventName(rs.getString("EventName"));
            r.setDate(rs.getString("Date"));
            r.setVenue(rs.getString("Venue"));
            r.setDescription(rs.getString("Description"));
            r.setFacultyName(rs.getString("Name"));
            AC.add(r);
        }
        
    }
    catch(Exception ex)
            {}
    return AC;
}//function
 public ArrayList<beans.Students> registeredStudents(int eventid)
    {
        ArrayList<beans.Students> AC = new ArrayList<Students>();
        beans.Students r;
    createConnection();
    try{
        PreparedStatement ps=con.prepareStatement("select StudentName,Contact,EmailID from students where studentid in(select studentid from registeredstudents where eventid=?)");
        ps.setInt(1, eventid);
        ResultSet rs=ps.executeQuery();
        while(rs.next())
        {
            r=new Students();
            r.setStudentName(rs.getString("StudentName"));
            r.setContact(rs.getString("Contact"));
            r.setEmailId(rs.getString("EmailID"));
            
            AC.add(r);
        }
        
    }
    catch(Exception ex)
            {}
    return AC;
}//function
  
}
package DataLayer;

import beans.Events;
import beans.Notice;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DALNotices extends DBOperations{
    public void addNotice(beans.Notice r)
    {
        createConnection();
        try{
            PreparedStatement ps=con.prepareStatement("insert into notices(Subject,Date,Description,FacultyId,Status) values(?,?,?,?,?)");
            ps.setString(1, r.getSubject());
            ps.setString(2, r.getDate());
            ps.setString(3, r.getDescription());
            ps.setInt(4, r.getFacultyId());
            ps.setByte(5, r.getStatus());
            System.out.print(ps);
            int res=ps.executeUpdate();
            System.out.print(res);
        }
        catch(Exception ex){}
    }//function
    
    public void deleteNotice(int factid)
    {
        createConnection();
        try{
            PreparedStatement ps=con.prepareStatement("delete from Notices where NoticeId=?");
            ps.setInt(1, factid);

            ps.executeUpdate();
            
        }
        catch(Exception ex)
        {}
        closeConnection();
    }//function
    
    public ArrayList<beans.Notice> getNotices(int factid)
    {
        ArrayList<beans.Notice> AC = new ArrayList<Notice>();
        
        createConnection();
        
        try
        {
            PreparedStatement ps = con.prepareStatement("select NoticeId,Subject,Convert(varchar,Date,103) as [Date],"
                    + "Description from Notices where FacultyId=? and Status=1");
            ps.setInt(1, factid);
            
            ResultSet rs = ps.executeQuery();
            
            
            beans.Notice obj;
            
            while(rs.next())
            {
                obj = new beans.Notice();
                obj.setNoticeId(rs.getInt("NoticeId"));
                obj.setSubject(rs.getString("Subject").trim());
                obj.setDate(rs.getString("Date").trim());
                obj.setDescription(rs.getString("Description").trim());
                

                AC.add(obj);
            }
        }
        catch(Exception ex)
        {
            
        }
        
        closeConnection();
        
        return AC;
    }//

public ArrayList<beans.Notice> getNewNotices(int factid)
    {
        ArrayList<beans.Notice> AC = new ArrayList<Notice>();
        
        createConnection();
        
        try
        {
            PreparedStatement ps = con.prepareStatement("select NoticeId,Subject,Convert(varchar,Date,103) as [Date],"
                    + "Description from Notices where FacultyId=? and Status=0");
            ps.setInt(1, factid);
            
            ResultSet rs = ps.executeQuery();
            
            
            beans.Notice obj;
            
            while(rs.next())
            {
                obj = new beans.Notice();
                obj.setNoticeId(rs.getInt("NoticeId"));
                obj.setSubject(rs.getString("Subject").trim());
                obj.setDate(rs.getString("Date").trim());
                obj.setDescription(rs.getString("Description").trim());
                

                AC.add(obj);
            }
        }
        catch(Exception ex)
        {
            
        }
        
        closeConnection();
        
        return AC;
    }//
    public ArrayList<beans.Notice> getCurrentNotices(int factid)
    {
        ArrayList<beans.Notice> AC = new ArrayList<Notice>();
        
        createConnection();
        
        try
        {
            PreparedStatement ps = con.prepareStatement("select NoticeId,Subject,Convert(varchar,Date,103) as Date,Description,Name from notices,faculties where notices.facultyid in(select facultyid from faculties where departmentid in(select departmentid from\n" +
"departments where registrationid=(select registrationid from departments where departmentid=(select departmentid from faculties where facultyid=?)))) and status=0 and notices.facultyid=faculties.facultyid");
            ps.setInt(1, factid);
            
            ResultSet rs = ps.executeQuery();
            
            
            beans.Notice obj;
            
            while(rs.next())
            {
                obj = new beans.Notice();
                obj.setNoticeId(rs.getInt("NoticeId"));
                obj.setSubject(rs.getString("Subject").trim());
                obj.setDate(rs.getString("Date").trim());
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
    }//

public ArrayList<beans.Notice> getStudentNotices(int stid)
    {
        ArrayList<beans.Notice> AC = new ArrayList<Notice>();
        
        createConnection();
        
        try
        {
            PreparedStatement ps = con.prepareStatement("select NoticeId,Subject,Convert(varchar,Date,103) as [Date],"
                    + "Description from Notices where FacultyId=(select facultyid from students where studentid=?) and status=0");
            ps.setInt(1, stid);
            
            ResultSet rs = ps.executeQuery();
            
            
            beans.Notice obj;
            
            while(rs.next())
            {
                obj = new beans.Notice();
                obj.setNoticeId(rs.getInt("NoticeId"));
                obj.setSubject(rs.getString("Subject").trim());
                obj.setDate(rs.getString("Date").trim());
                obj.setDescription(rs.getString("Description").trim());
                

                AC.add(obj);
            }
        }
        catch(Exception ex)
        {
            
        }
        
        closeConnection();
        
        return AC;
    }//


public void hideNotice(int noticeid)
        {
            createConnection();
            try{
                PreparedStatement ps=con.prepareStatement("Update notices set status=1 where noticeid=?");
                ps.setInt(1, noticeid);
                ps.executeUpdate();
            }
            catch(Exception ex)
                    {}
        }//function

    public beans.Notice getNoticeDetails(int noticeid)
{
   beans.Notice r=new Notice();
    createConnection();
    try{
        PreparedStatement ps=con.prepareStatement("select NoticeId,Subject,Convert(varchar,Date,103) as [Date],Description,Name from notices,faculties "
                + "where noticeid=? and notices.FacultyId=Faculties.FacultyId");
        ps.setInt(1, noticeid);
        ResultSet rs=ps.executeQuery();
        while(rs.next())
            {
            r.setNoticeId(rs.getInt("NoticeId"));
            r.setSubject(rs.getString("Subject"));
            r.setDate(rs.getString("Date"));
            r.setDescription(rs.getString("Description"));
            r.setFacultyName(rs.getString("Name"));
            }///while
        }
    catch(Exception ex)
    {}//catch
   return r;
}//function
    
public void updateNotice(beans.Notice r)

{
    createConnection();
    try{
        PreparedStatement ps=con.prepareStatement("update Notices set Subject=?,Date=?,Description=? where NoticeId=?");
        ps.setString(1, r.getSubject());
        ps.setString(2, r.getDate());
        ps.setString(3, r.getDescription());
        ps.setInt(4, r.getNoticeId());
        ps.executeUpdate();
        
    }
    catch(Exception ex)
    {
    }//catch
}//function

}

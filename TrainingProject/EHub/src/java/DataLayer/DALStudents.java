package DataLayer;

import beans.Faculties;
import beans.Students;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DALStudents extends DBOperations {
    
     public boolean UserAvailability(String UserId,int factid)
    {
        boolean flag=true;
        createConnection();
        try{
            PreparedStatement ps=con.prepareStatement("select * from Students where UserId=? and FacultyId=?");
            ps.setString(1, UserId);
            ps.setInt(2, factid);
            ResultSet rs=ps.executeQuery();
          while(rs.next())
          {
              flag=false;
          }
        }//try
        catch(Exception ex)
        {}//catch
        return flag;
    }//function
    
     public void addStudents(beans.Students b)
    {
        createConnection();
        try{
            PreparedStatement ps=con.prepareStatement("insert into Students values(?,?,?,?,?,?,?,?)");
            ps.setString(1, b.getStudentName());
            ps.setString(2, b.getGender());
            ps.setString(3, b.getDOB());
            
            ps.setString(4, b.getContact());
            ps.setString(5, b.getEmailId());
            ps.setString(6, b.getUserId());
            ps.setString(7, b.getPassword());
            ps.setInt(8, b.getFacultyId());
            ps.executeUpdate();

        }
        catch(Exception ex)
        {}
closeConnection();
    }
     
     public void deleteStudent(int stdid)
    {
        createConnection();
        try{
            PreparedStatement ps=con.prepareStatement("delete from Students where StudentId=?");
            ps.setInt(1, stdid);

            ps.executeUpdate();
            
        }
        catch(Exception ex)
        {}
        closeConnection();
    }//function

     public ArrayList<beans.Students> getStudents(int Factid)
    {
        ArrayList<beans.Students> AC = new ArrayList<Students>();
        
        createConnection();
        
        try
        {
            PreparedStatement ps = con.prepareStatement("select StudentId,StudentName,convert(varchar,DOB,103) as [DOB],Contact,EmailId,UserId,Password from Students where FacultyId=?");
                    
            ps.setInt(1, Factid);
            ResultSet rs = ps.executeQuery();
            
            
            beans.Students obj;
            
            while(rs.next())
            {
                obj = new beans.Students();
                obj.setStudentId(rs.getInt("StudentId"));
                obj.setStudentName(rs.getString("StudentName").trim());
                obj.setDOB(rs.getString("DOB").trim());
                obj.setContact(rs.getString("Contact").trim());
                obj.setEmailId(rs.getString("EmailId").trim());
                obj.setUserId(rs.getString("UserId").trim());
                obj.setPassword(rs.getString("Password").trim());
                
                AC.add(obj);
            }
        }
        catch(Exception ex)
        {
            
        }
        
        closeConnection();
        
        return AC;
    }//

       public beans.Students authenticateUser(String pUserId, String pPassword)
    {
        beans.Students obj = new Students();
        
        if(createConnection()==true)
        {
            try
            {
                PreparedStatement ps = con.prepareStatement("Select * From students Where UserId=? and Password=?");
                ps.setString(1, pUserId);
                ps.setString(2, pPassword);
                
                ResultSet rs = ps.executeQuery();
                
                boolean b =rs.next();
                
                if(b==true)
                {
                    obj.setStudentId(rs.getInt("StudentId"));
                    obj.setStudentName(rs.getString("StudentName").trim());
                    obj.setGender(rs.getString("Gender").trim());
                    obj.setDOB(rs.getString("DOB").trim());
                    obj.setContact(rs.getString("Contact").trim());
                    obj.setEmailId(rs.getString("EmailId").trim());
                    obj.setUserId(rs.getString("UserId").trim());
                    obj.setPassword(rs.getString("Password").trim());
                    obj.setFacultyId(rs.getInt("FacultyId"));
                    
                    
                    
                }
                rs.close();
                
            }
            catch(Exception ex)
            {
                
            }

        }//Connection Check
        
        return obj;
    }//Function

       public String giveFacultyName(int stid)
       {
           createConnection();
           String FacultyName="";
           try{
           
               PreparedStatement ps=con.prepareStatement("select Name from faculties where facultyid=(select facultyid from students where studentid=?)");
               ps.setInt(1, stid);
               ResultSet rs=ps.executeQuery();
               while(rs.next())
               {
                FacultyName=rs.getString("Name");
               }
           }
           catch(Exception ex)
           {}
           return FacultyName;
       }
       
       
    public beans.Students getData(int StudentId)
     {
         beans.Students obj=new Students();
         createConnection();
         try{
             
             PreparedStatement ps=con.prepareStatement("select StudentName,Gender,Convert(varchar,DOB,103) as [DOB],Contact,EmailId,FacultyId from Students where StudentId=?");
             ps.setInt(1, StudentId);
             ResultSet rs=ps.executeQuery();
             if(rs.next()){
                    
                    obj.setStudentName(rs.getString("StudentName"));
                    obj.setGender(rs.getString("Gender"));
                    obj.setDOB(rs.getString("DOB"));
                    obj.setContact(rs.getString("Contact"));
                    obj.setEmailId(rs.getString("EmailId"));
                    obj.setFacultyId(rs.getInt("FacultyId"));
                     
             }
         }
         catch(Exception ex){
         }
         return obj;
     }
 public void changePassword(int stid,String pwd)
     {
         createConnection();
         try{
             PreparedStatement ps=con.prepareStatement("update students set password=? where studentid=?");
             ps.setString(1, pwd);
             ps.setInt(2, stid);
             ps.executeUpdate();
             con.close();
         }
         catch(Exception ex)
         {
         }
         
     }

}

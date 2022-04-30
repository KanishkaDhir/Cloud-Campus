package DataLayer;

import beans.Departments;
import beans.Faculties;
import beans.Registration;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DALFaculty extends DBOperations{
    
    public boolean UserAvailability(String UserId,int deptid)
    {
        boolean flag=true;
        createConnection();
        try{
            PreparedStatement ps=con.prepareStatement("select * from faculties where UserId=? and DepartmentId=?");
            ps.setString(1, UserId);
            ps.setInt(2, deptid);
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
    
    public void addFaculty(beans.Faculties b)
    {
        createConnection();
        try{
            System.out.print("inside addfaculty function");
            PreparedStatement ps=con.prepareStatement("insert into faculties(Name,Gender,Address,City,ContactNo,EmailId,UserId,Password,DepartmentId) values(?,?,?,?,?,?,?,?,?)");
            ps.setString(1, b.getName());
            ps.setString(2, b.getGender());
            ps.setString(3, b.getAddress());
            ps.setString(4, b.getCity());
            ps.setString(5, b.getContactNo());
            ps.setString(6, b.getEmailId());
            ps.setString(7, b.getUserId());
            ps.setString(8, b.getPassword());
            ps.setInt(9, b.getDepartmentId());
            System.out.print(ps);
            int res= ps.executeUpdate();
           System.out.print(res);
        }
        catch(Exception ex)
        {}
          closeConnection();
    }
    
 public ArrayList<beans.Faculties> getFaculties(int regid)
    {
        ArrayList<beans.Faculties> AC = new ArrayList<Faculties>();
        
        createConnection();
        
        try
        {
            PreparedStatement ps = con.prepareStatement("select FacultyId,Name,Address,City,ContactNo,EmailId,UserId,Password,DepartmentName "
                    + "from faculties,departments where departments.departmentid=faculties.departmentid and "
                    + "departments.registrationid=?");
            ps.setInt(1, regid);
            ResultSet rs = ps.executeQuery();
            
            
            beans.Faculties obj;
            
            while(rs.next())
            {
                obj = new beans.Faculties();
                obj.setFacultyId(rs.getInt("FacultyId"));
                obj.setName(rs.getString("Name").trim());
                obj.setAddress(rs.getString("Address").trim());
                obj.setCity(rs.getString("City").trim());
                obj.setContactNo(rs.getString("ContactNo").trim());
                obj.setEmailId(rs.getString("EmailId").trim());
                obj.setUserId(rs.getString("UserId").trim());
                obj.setPassword(rs.getString("Password").trim());
                
                obj.setDepartmentName(rs.getString("DepartmentName").trim());
                

                AC.add(obj);
            }
        }
        catch(Exception ex)
        {
            
        }
        
        closeConnection();
        
        return AC;
    }//

       public void deleteFaculty(int factid)
    {
        createConnection();
        try{
            PreparedStatement ps=con.prepareStatement("delete from faculties where FacultyId=?");
            ps.setInt(1, factid);

            ps.executeUpdate();
            
        }
        catch(Exception ex)
        {}
        closeConnection();
    }//function

       public beans.Faculties authenticateUser(String pUserId, String pPassword)
    {
        beans.Faculties obj = new Faculties();
        
        if(createConnection()==true)
        {
            try
            {
                PreparedStatement ps = con.prepareStatement("Select * From faculties Where UserId=? and Password=?");
                ps.setString(1, pUserId);
                ps.setString(2, pPassword);
                
                ResultSet rs = ps.executeQuery();
                
                boolean b =rs.next();
                
                if(b==true)
                {
                    obj.setFacultyId(rs.getInt("FacultyId"));
                    obj.setName(rs.getString("Name").trim());
                    obj.setGender(rs.getString("Gender").trim());
                    obj.setAddress(rs.getString("Address").trim());
                    obj.setCity(rs.getString("City").trim());
                    obj.setContactNo(rs.getString("ContactNo").trim());
                    obj.setEmailId(rs.getString("EmailId").trim());
                    obj.setUserId(rs.getString("UserId"));
                    obj.setPassword(rs.getString("Password"));
                    
                    obj.setDepartmentId(rs.getInt("DepartmentId"));
                    
                    
                    
                    
                }
                rs.close();
                
            }
            catch(Exception ex)
            {
                
            }

        }//Connection Check
        
        return obj;
    }//Function
       public String giveDeptName(int factid)
       {
           createConnection();
           String DeptName="";
           try{
           
               PreparedStatement ps=con.prepareStatement("select DepartmentName from departments where departmentid=(select departmentid from faculties where facultyid=?)");
               ps.setInt(1, factid);
               ResultSet rs=ps.executeQuery();
               while(rs.next())
               {
                DeptName=rs.getString("DepartmentName");
               }
           }
           catch(Exception ex)
           {}
           return DeptName;
       }
 public beans.Faculties getData(int FacultyId)
     {
         beans.Faculties obj=new Faculties();
         createConnection();
         try{
             
             PreparedStatement ps=con.prepareStatement("select * from Faculties where FacultyId=?");
             ps.setInt(1, FacultyId);
             ResultSet rs=ps.executeQuery();
             if(rs.next()){
                    obj.setName(rs.getString("Name"));
                    obj.setGender(rs.getString("Gender"));
                    obj.setAddress(rs.getString("Address"));
                    obj.setCity(rs.getString("City"));
                    obj.setContactNo(rs.getString("ContactNo"));
                    obj.setEmailId(rs.getString("EmailId"));
                    obj.setDepartmentId(rs.getInt("DepartmentId"));
                     
             }
         }
         catch(Exception ex){
         }
         return obj;
     }

  public void changePassword(String pwd,int factid)
     {
         createConnection();
         try{
             PreparedStatement ps=con.prepareStatement("update faculties set password=? where facultyid=?");
             ps.setString(1, pwd);
             ps.setInt(2, factid);
             ps.executeUpdate();
             con.close();
         }
         catch(Exception ex)
         {
         }
         
     }
}

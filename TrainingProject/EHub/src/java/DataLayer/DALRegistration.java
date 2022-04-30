package DataLayer;

import beans.Registration;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DALRegistration extends DBOperations{
   
    public void register(beans.Registration obj)
    {
        
        createConnection();
        
        try
        {
            System.out.print("regisering");
            PreparedStatement ps = con.prepareStatement("Insert into registrations(UserID,Password,InstituteName,Address,City,EmailID,SecurityQuestion,Answer,Code) values(?,?,?,?,?,?,?,?,?)");
            ps.setString(1, obj.getUserID());
            ps.setString(2, obj.getPassword());
            ps.setString(3, obj.getInstituteName());
            ps.setString(4, obj.getAddress());
            ps.setString(5, obj.getCity());
            ps.setString(6, obj.getEmailID());
            ps.setString(7, obj.getSecurityQuestion());
            ps.setString(8, obj.getAnswer());
            ps.setString(9, obj.getCode());
            System.out.print(ps);
            int res=ps.executeUpdate();
            System.out.print(res);
           // ps.executeUpdate();
        }
        catch(Exception ex)
        {
            
        }
        
        
    }//function
     public beans.Registration authenticateUser(String pUserId, String pPassword)
    {
        beans.Registration obj = new Registration();
        
        if(createConnection()==true)
        {
            try
            {
               System.out.print("In authentictae user");
                PreparedStatement ps = con.prepareStatement("Select * From Registrations Where UserID=? and Password=?");
                ps.setString(1, pUserId);
                ps.setString(2, pPassword);
                System.out.print(""+ps);
                ResultSet rs = ps.executeQuery();
                
                boolean b =rs.next();
                
                if(b==true)
                {
                    obj.setRegistrationID(rs.getInt("RegistrationID"));
                    obj.setUserID(rs.getString("UserID").trim());
                    obj.setPassword(rs.getString("Password").trim());
                    obj.setInstituteName(rs.getString("InstituteName").trim() );
                    obj.setAddress(rs.getString("Address").trim());
                    obj.setCity(rs.getString("City").trim());
                    obj.setEmailID(rs.getString("EmailID").trim());
                    obj.setSecurityQuestion(rs.getString("SecurityQuestion").trim());
                    obj.setAnswer(rs.getString("Answer").trim());
                    obj.setCode(rs.getString("Code").trim());
                    
                    
                }
                else
                { obj.setRegistrationID(0);
                }
                 rs.close();
                
            }
            catch(Exception ex)
            {
                
            }

        }//Connection Check
        
        return obj;
    }//Function

     public boolean UserAvailability(String pUserid)
    {
        System.out.print("in user availabilty");
        boolean ret=false;
        createConnection();
        try{
        PreparedStatement ps=con.prepareStatement("Select * from Registrations where UserID=?");
        ps.setString(1, pUserid);
        
       System.out.print(ps);
            ResultSet rs=ps.executeQuery();
           ret=rs.next();
           System.out.print(ret);
           rs.close();
        }
        catch(Exception ex )
        {
        }
        
        
        return !ret;
    }

          public boolean CodeAvailability(String Codes)
    {
        System.out.print("Inside code availability");
        boolean ret=false;
        createConnection();
        try{
        PreparedStatement ps=con.prepareStatement("Select * from Registrations where Code=?");
        ps.setString(1, Codes);
        System.out.print(""+ps);
       
            ResultSet rs=ps.executeQuery();
           ret=rs.next();
           System.out.print(ret);
           rs.close();
        }
        catch(Exception ex )
        {
        }
        
        
        return !ret;
    }//function

               public beans.Registration getData(int RegistrationId)
     {
         beans.Registration obj=new Registration();
         createConnection();
         try{
             
             PreparedStatement ps=con.prepareStatement("select * from Registrations where registrationid=?");
             ps.setInt(1, RegistrationId);
             ResultSet rs=ps.executeQuery();
             if(rs.next()){
                    obj.setUserID(rs.getString("UserID"));
                    obj.setInstituteName(rs.getString("InstituteName"));
                    obj.setAddress(rs.getString("Address"));
                    obj.setCity(rs.getString("City"));
                    obj.setEmailID(rs.getString("EmailID"));
                    obj.setCode(rs.getString("Code"));
                     
             }
         }
         catch(Exception ex){
         }
         return obj;
     }
               public beans.Registration getRegistartion(int Regid)
               {
                   beans.Registration obj=new Registration();
                   createConnection();
                   try{
                        PreparedStatement ps=con.prepareStatement("select InstituteName,Address,City,EmailID from registrations where registrationid=?");
                        ps.setInt(1, Regid);
                        ResultSet rs=ps.executeQuery();
                        while(rs.next()){
                        obj.setInstituteName(rs.getString("InstituteName").trim());
                        obj.setAddress(rs.getString("Address").trim());
                        obj.setCity(rs.getString("City").trim());
                        obj.setEmailID(rs.getString("EmailID").trim());
                        }
                   }
                   catch(Exception ex){}
                   return obj;
               }
         public void UpdateProfile(beans.Registration obj)
    {
        
        createConnection();
        
        try
        {
            PreparedStatement ps = con.prepareStatement("update Registrations set InstituteName=?,Address=?,City=?,EmailId=? where registrationid=?");
            ps.setString(1, obj.getInstituteName());
            ps.setString(2, obj.getAddress());
            ps.setString(3, obj.getCity());
            ps.setString(4, obj.getEmailID());
            ps.setInt(5,obj.getRegistrationID());
            
            ps.executeUpdate();
        }
        catch(Exception ex)
        {
            
        }
        
        
    }//function

          public void changePassword(int regid,String pwd)
     {
         createConnection();
         try{
             PreparedStatement ps=con.prepareStatement("update registrations set password=? where registrationid=?");
             ps.setString(1, pwd);
             ps.setInt(2, regid);
             ps.executeUpdate();
             con.close();
         }
         catch(Exception ex)
         {
         }
         
     }//function
             }


package DataLayer;

import beans.Departments;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DALDepartments extends DBOperations{
    
    
    public boolean checkDepartment(String dname,int regid)
    {
        boolean b=true; 
        createConnection();
        try{
            PreparedStatement ps=con.prepareStatement("select * from Departments where DepartmentName=? and RegistrationId=?"); 
          
            ps.setString(1, dname);
              ps.setInt(2, regid);
            ResultSet rs=ps.executeQuery();
            if(rs.next()==true)
            {
                b=false;
            }
            
            
        }
        catch(Exception ex)
        {
        }
        return b;
    }//function
    
    public void addDepartment(String dname,int regid)
    {
        createConnection();
        try{
           PreparedStatement ps=con.prepareStatement("insert into departments(DepartmentName,RegistrationId) values(?,?)");
           ps.setString(1, dname);
           ps.setInt(2, regid);
           System.out.print(ps);
           int res=ps.executeUpdate();
           System.out.print(res);
        }
        catch(Exception ex)
        {
        }
    }
    public ArrayList<beans.Departments> getDepartments(int regid)
    {
        ArrayList<beans.Departments> AC = new ArrayList<Departments>();
        
        createConnection();
        
        try
        {
            PreparedStatement ps = con.prepareStatement("Select DepartmentId,DepartmentName From Departments where RegistrationId=?");
            ps.setInt(1, regid);
            ResultSet rs = ps.executeQuery();
            
            
            beans.Departments obj;
            
            while(rs.next())
            {
                obj = new beans.Departments();
                
                obj.setDepartmentId(rs.getInt("DepartmentId"));
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

    public void deleteDepartment(int deptid)
    {
        createConnection();
        try{
            PreparedStatement ps=con.prepareStatement("delete from departments where DepartmentId=?");
            ps.setInt(1, deptid);

            ps.executeUpdate();
            
        }
        catch(Exception ex)
        {}
        closeConnection();
    }//function

    public int giveDeptId(String dname,int regId )
    {
        int i=0;
        createConnection();
        try{
            
            PreparedStatement ps=con.prepareStatement("select DepartmentId from departments where DepartmentName=? and RegistrationId=?");
            ps.setString(1, dname);
            ps.setInt(2, regId);
            ResultSet rs=ps.executeQuery();
            beans.Departments d=new beans.Departments();
            while(rs.next())
            i=rs.getInt("DepartmentId");
        }
        catch(Exception ex){}
        return i;
    }//function
}

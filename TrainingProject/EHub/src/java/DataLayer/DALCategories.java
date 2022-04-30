package DataLayer;

import beans.Departments;
import beans.Tests;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DALCategories extends DBOperations{
    
    public boolean checkCategory(String cname)
    {
        boolean b=true; 
        createConnection();
        try{
            PreparedStatement ps=con.prepareStatement("select * from Categories where CategoryName=?"); 
          
            ps.setString(1, cname);
              
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
    
    
    public void addCategory(String nm)
    {
        createConnection();
        try{
            PreparedStatement ps=con.prepareStatement("insert into categories values(?)");
            ps.setString(1, nm);
            ps.executeUpdate();
        }
        catch(Exception ex) 
        {
            
        }
    }//function
    
    public ArrayList<beans.Tests> getCategories()
    {
        ArrayList<beans.Tests> AC = new ArrayList<Tests>();
        
        createConnection();
        
        try
        {
            PreparedStatement ps = con.prepareStatement("Select CategoryId,CategoryName From Categories");
            
            ResultSet rs = ps.executeQuery();
            
            
            beans.Tests obj;
            
            while(rs.next())
            {
                obj = new beans.Tests();
                
                obj.setCategoryId(rs.getInt("CategoryId"));
                obj.setCategoryName(rs.getString("CategoryName").trim());
                

                AC.add(obj);
            }
        }
        catch(Exception ex)
        {
            
        }
        
        closeConnection();
        
        return AC;
    }//
    public int giveCategoryId(String cname)
    {
        int i=0;
        createConnection();
        try{
            
            PreparedStatement ps=con.prepareStatement("select CategoryId from Categories where CategoryName=?");
            ps.setString(1, cname);
            
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            i=rs.getInt("CategoryId");
        }
        catch(Exception ex){}
        return i;
    }//function


    
    
}

package DataLayer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public abstract class DBOperations
{

    public Connection con;
    
        public boolean createConnection()
           { boolean b=false;
             try{
                     Class.forName("com.mysql.jdbc.Driver");
		     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cloudcampus","root","bce");
                     b=true;
                     System.out.print("Connected");
                }//try
             catch(Exception ex)
             {
              }//catch
              return b;
             }//function
        public void closeConnection()
        {
               if(con!=null)
            {
                try
                {
                   if(con.isClosed()==false)
                   {
                       con.close();
                    }
                 }
                catch(SQLException ex)
                {
                
                 }//Catch
             }
         }//Function
}


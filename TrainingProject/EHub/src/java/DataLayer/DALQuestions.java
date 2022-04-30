package DataLayer;

import beans.Questions;
import com.sun.xml.ws.tx.at.v10.types.PrepareResponse;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DALQuestions extends DBOperations{
    
    public ArrayList<beans.Questions> getQuestions(int CategoryId,int NOQ)
    {
        createConnection();

        ArrayList<beans.Questions> ACQ=new ArrayList<Questions>();

        try{
            Statement st = con.createStatement();

            ResultSet rs= st.executeQuery("select top "+NOQ+" * from questions where CategoryId="+CategoryId+"  order by newId()");  
            beans.Questions q;

            String Temp="";
            int QID;

            while(rs.next())
            {
                q=new Questions();

                QID=rs.getInt("QuestionId");

                q.setQuestionId(QID);
                q.setQuestionText(rs.getString("QuestionText").trim());

                Temp = Temp+QID+",";
                
                ACQ.add(q);
            }
            
            rs.close();
        
            Temp= Temp.substring(0, Temp.length()-1);
            
            rs = st.executeQuery("Select * From Options Where QuestionID IN ("+ Temp+")");
            
            beans.Options opt;
            
            while(rs.next())
            {
                opt = new beans.Options();
                opt.setOptionId(rs.getInt("OptionId"));
                opt.setOptionText(rs.getString("OptionText").trim());
                opt.setIsAnswer(rs.getByte("IsAnswer"));
                
                QID = rs.getInt("QuestionId");

                for(beans.Questions Q : ACQ )
                {
                    if(Q.getQuestionId()==QID)
                    {
                        Q.options.add(opt);
                    }
                }
            }
            
            rs.close();
            
        }
        
        catch(Exception ex){}
        
        return ACQ;
    }//function
}

package DataLayer;

import beans.Questions;
import beans.Tests;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DALTests extends DBOperations{
    public void addScheduledTest(beans.Tests r)
    {
        createConnection();
        try{
            PreparedStatement ps=con.prepareStatement("Insert into ScheduledTests values(?,?,?,?,?,?)");
            ps.setString(1, r.getDate());
            ps.setString(2, r.getLastDate());
            ps.setInt(3, r.getFacultyId());
            ps.setInt(4, r.getCategoryId());
            ps.setInt(5, r.getNOQ());
            ps.setInt(6, r.getDuration());
            ps.executeUpdate();
        }
        catch(Exception ex){}
        closeConnection();
    }//function

    public boolean checkTestAvailability(int testid,int studentid)
    {
        boolean b=true;
        createConnection();
        try{
            PreparedStatement ps=con.prepareStatement("select * from ConductedTests where testid=? and studentid=?");
            ps.setInt(1, testid);
            ps.setInt(2, studentid);
            ResultSet rs= ps.executeQuery();
            if(rs.next()==true)
            {
                b=false;
            }
            
        }
        catch(Exception ex)
        {}
        return b;
    }
    
    public ArrayList<beans.Tests> getTestList(int factid)
    {
        ArrayList<beans.Tests> AC = new ArrayList<Tests>();
        
        createConnection();
        
        try
        {
            PreparedStatement ps = con.prepareStatement("Select STID,convert(varchar,Date,103) as Date,convert(varchar,LastDate,103) as LastDate,"
                    + "CategoryName,NOQ,Duration from scheduledtests,categories where facultyid=? and scheduledtests.categoryid=categories.categoryid");
            ps.setInt(1, factid);
            ResultSet rs = ps.executeQuery();
            
            
            beans.Tests obj;
            
            while(rs.next())
            {
                obj = new beans.Tests();
                obj.setSTID(rs.getInt("STID"));
                obj.setDate(rs.getString("Date").trim());
                obj.setLastDate(rs.getString("LastDate").trim());
                obj.setCategoryName(rs.getString("CategoryName"));
                obj.setNOQ(rs.getInt("NOQ"));
                obj.setDuration(rs.getInt("Duration"));
                
                

                AC.add(obj);
            }
        }
        catch(Exception ex)
        {
            
        }
        
        closeConnection();
        
        return AC;
    }//
    public beans.Tests getTestDetails(int testid)
    {
        createConnection();
        beans.Tests t=new Tests();
        try{
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select CategoryId,NOQ from ScheduledTests where STID="+testid);
        while(rs.next())
            {
                t.setCategoryId(rs.getInt("CategoryId"));
                t.setNOQ(rs.getInt("NOQ"));
            }
        }
        catch(Exception ex){}
        return t;
    }//function

    public void addConductedTest(int testid,int studentid, ArrayList<beans.Questions> AttemptedQuestions)
    {
    createConnection();
    int condid=0;
    try{
        
        CallableStatement cs = con.prepareCall("{call sp_SubmitTest(?,?,?)}");

        cs.registerOutParameter(1, java.sql.Types.INTEGER);
        cs.setInt(2, testid);
        cs.setInt(3, studentid);
        
        cs.executeUpdate();
        
        condid= cs.getInt(1);
        
        for(beans.Questions Q: AttemptedQuestions)
        {
            PreparedStatement ps=con.prepareStatement("Insert into AttemptedQuestions values(?,?,?)");
            ps.setInt(1, Q.getQuestionId());
            ps.setInt(2, Q.getOptionId());
            ps.setInt(3, condid);
            ps.executeUpdate();
        }
        
        
    }
    catch(Exception ex){}
closeConnection();
}//function

public beans.Tests getTestHistory(int testid,int studentid)
{
createConnection();
    beans.Tests t=new Tests();
    try{
        PreparedStatement ps=con.prepareStatement("Select S.StudentId, S.StudentName,convert(varchar,CT.Date,103) as Date,(Select Count(*) From AttemptedQuestions as [AQ], Options as [O]\n" +
" Where ConductedTestId=CT.ConductedTestID and AQ.OptionId=O.OptionId ) as AttemptedQuestions,\n" +
"(Select Count(*)  From AttemptedQuestions as [AQ], Options as [O]\n" +
" Where ConductedTestId=CT.ConductedTestID and AQ.OptionId=O.OptionId and O.IsAnswer=1) as CorrectAnswers,(Select Count(*)  From AttemptedQuestions as [AQ], Options as [O]\n" +
" Where ConductedTestId=CT.ConductedTestID and AQ.OptionId=O.OptionId and O.IsAnswer=0) as WrongAnswers,st.NOQ,Categories.CategoryName\n" +
"from Students AS [S], ConductedTests as [CT],ScheduledTests as st,Categories where S.StudentId=Ct.StudentId and CT.TestId=? and st.stid=? and st.categoryid=categories.categoryid and s.studentid=?");
        ps.setInt(1, testid);
        ps.setInt(2, testid);
        ps.setInt(3, studentid);
        ResultSet rs=ps.executeQuery();
        
        
        while(rs.next())
        {
            t.setStudentId(rs.getInt("StudentId"));
            t.setStudentName(rs.getString("StudentName").trim());
            t.setDate(rs.getString("Date"));
            t.setAttemptedQuestions(rs.getInt("AttemptedQuestions"));
            t.setCorrectAnswers(rs.getInt("CorrectAnswers"));
            t.setWrongAnswers(rs.getInt("WrongAnswers"));
            t.setNOQ(rs.getInt("NOQ"));
            t.setCategoryName(rs.getString("CategoryName"));
            
        }
        
    }
    catch(Exception ex){}
    return t;
}//function
public ArrayList<beans.Questions> giveAnswers(int testid,int studentid)
{
    createConnection();
    ArrayList<beans.Questions> AP=new ArrayList<Questions>();
    beans.Questions obj;
    try{
        PreparedStatement ps=con.prepareStatement("Select Q.QuestionText, O.OptionText \n" +
"From Questions AS [Q], Options as [O], AttemptedQuestions as [AQ], ConductedTests as [CT]\n" +
"Where Q.QuestionID=AQ.QuestionID and O.OptionId=AQ.OptionID and AQ.ConductedTestId=Ct.ConductedTestID\n" +
"and TestID=? and StudentID=?");
        ps.setInt(1, testid);
        ps.setInt(2, studentid);
        ResultSet rs=ps.executeQuery();
        while(rs.next())
        {
            obj=new Questions();
            obj.setQuestionText(rs.getString("QuestionText"));
            obj.setOptionText(rs.getString("OptionText"));
            
        AP.add(obj);
        }//while
        
    }//try
    catch(Exception ex){}
    return AP;
}//function

public ArrayList getStudentsTestHistory(int testid)
{
createConnection();

ArrayList<beans.Tests> AQ=new ArrayList<Tests>();
    beans.Tests t;
    try{
        PreparedStatement ps=con.prepareStatement("Select S.StudentId, S.StudentName,convert(varchar,CT.Date,103) as Date,(Select Count(*) From AttemptedQuestions as [AQ], Options as [O]\n" +
" Where ConductedTestId=CT.ConductedTestID and AQ.OptionId=O.OptionId ) as AttemptedQuestions,\n" +
"(Select Count(*)  From AttemptedQuestions as [AQ], Options as [O]\n" +
" Where ConductedTestId=CT.ConductedTestID and AQ.OptionId=O.OptionId and O.IsAnswer=1) as CorrectAnswers,(Select Count(*)  From AttemptedQuestions as [AQ], Options as [O]\n" +
" Where ConductedTestId=CT.ConductedTestID and AQ.OptionId=O.OptionId and O.IsAnswer=0) as WrongAnswers,st.NOQ,Categories.CategoryName\n" +
"from Students AS [S], ConductedTests as [CT],ScheduledTests as st,Categories where S.StudentId=Ct.StudentId and CT.TestId=? and st.stid=? and st.categoryid=categories.categoryid");
        ps.setInt(1, testid);
        ps.setInt(2, testid);
        ResultSet rs=ps.executeQuery();
        
        
        while(rs.next())
        {
            t=new Tests();
            t.setStudentId(rs.getInt("StudentId"));
            t.setStudentName(rs.getString("StudentName").trim());
            t.setDate(rs.getString("Date"));
            t.setAttemptedQuestions(rs.getInt("AttemptedQuestions"));
            t.setCorrectAnswers(rs.getInt("CorrectAnswers"));
            t.setWrongAnswers(rs.getInt("WrongAnswers"));
            t.setNOQ(rs.getInt("NOQ"));
            t.setCategoryName(rs.getString("CategoryName"));
            AQ.add(t);
        }
        
    }
    catch(Exception ex){}
    return AQ;
}//function


}

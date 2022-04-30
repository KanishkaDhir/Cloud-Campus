package beans;

import java.util.ArrayList;

public class Questions {

    private int QuestionId;
    private String QuestionText;
    private int CategoryId;
    private String CategoryName;
    private int OptionId;
    private String OptionText;

    public String getOptionText() {
        return OptionText;
    }

    public void setOptionText(String OptionText) {
        this.OptionText = OptionText;
    }
    
public ArrayList<Options> options=new ArrayList<Options>();

    public int getOptionId() {
        return OptionId;
    }

    public void setOptionId(int OptionId) {
        this.OptionId = OptionId;
    }
    
    
    public int getQuestionId() {
        return QuestionId;
    }

    public void setQuestionId(int QuestionId) {
        this.QuestionId = QuestionId;
    }

    public String getQuestionText() {
        return QuestionText;
    }

    public void setQuestionText(String QuestionText) {
        this.QuestionText = QuestionText;
    }

    public int getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(int CategoryId) {
        this.CategoryId = CategoryId;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    public ArrayList<Options> getOptions() {
        return options;
    }

    public void setOptions(ArrayList<Options> options) {
        this.options = options;
    }
    
}

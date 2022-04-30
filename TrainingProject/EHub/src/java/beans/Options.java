package beans;

public class Options {

    private int OptionId;
    private String OptionText;
    private byte IsAnswer;
    private int QuestionId;

    public int getOptionId() {
        return OptionId;
    }

    public void setOptionId(int OptionId) {
        this.OptionId = OptionId;
    }

    public String getOptionText() {
        return OptionText;
    }

    public void setOptionText(String OptionText) {
        this.OptionText = OptionText;
    }

    public byte getIsAnswer() {
        return IsAnswer;
    }

    public void setIsAnswer(byte IsAnswer) {
        this.IsAnswer = IsAnswer;
    }

    public int getQuestionId() {
        return QuestionId;
    }

    public void setQuestionId(int QuestionId) {
        this.QuestionId = QuestionId;
    }
    
    
}

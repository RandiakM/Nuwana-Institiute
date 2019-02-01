/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package App.Fees;

/**
 *
 * @author Randika Madhushan
 */
public class Fees {
    
    private String studentid;
    private String stgrade;
    private String stsubject;
    private String amount;
    private String month;
    
    public Fees(String StudentID, String StGrade, String StSubject, String Amount, String Month){
       
        this.studentid=StudentID;
        this.stgrade=StGrade;
        this.stsubject=StSubject;
        this.amount=Amount;
        this.month=Month;
    }
    public String getStdID(){
        return studentid;
    }
    public String getStdGrade(){
        return stgrade;
    }
    public String getStdSubject(){
        return stsubject;
    }
    public String getStdAmount(){
        return amount;
    }
    public String getStdMonth(){
        return month;
    }
}

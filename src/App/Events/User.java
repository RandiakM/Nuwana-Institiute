package App.Events;


public class User {

    private String HallName;
    private String ClassDay;
    private String StartTime;
    private String EndTime;
    private String SubjectCode;
    
    private int Halld;

    public User( String HallName, String ClassDay, String StartTime,String EndTime, String SubjectCode) {
        
        
        this.HallName=HallName;
        this.ClassDay=ClassDay;
        this.StartTime=StartTime;
        this.EndTime=EndTime;
        this.SubjectCode=SubjectCode;
        
        
    }
    
    public int getHallId(){
            return Halld;
        }
     public String getHallName(){
            return HallName;
        }
      public String getClassDay(){
            return ClassDay;
        }
       public String getStartTime(){
            return StartTime;
        }
        public String getEndTime(){
            return EndTime;
        }
        public String getSubjectCode(){
            return SubjectCode;
        }
    
    
}

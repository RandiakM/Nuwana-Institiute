
package App.Events;


public class Extra {
    private String HallName;
    private String ClassDay;
    private String StartTime;
    private String EndTime;
    private String SubjectCode;
    private String TeacherId;
    

    public Extra( String HallName, String ClassDay, String StartTime,String EndTime, String SubjectCode, String TeacherId) {
        
        
        this.HallName=HallName;
        this.ClassDay=ClassDay;
        this.StartTime=StartTime;
        this.EndTime=EndTime;
        this.SubjectCode=SubjectCode;
        this.TeacherId=TeacherId;
        
        
    }
    
    public String getTeacherId(){
            return TeacherId;
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

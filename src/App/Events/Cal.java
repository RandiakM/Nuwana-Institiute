
package App.Events;

class Cal {
    private String EventName;
    private String StartTime;
    private String EndTime;
    private String EventDate;
    
    public Cal(String EventName,String StartTime,String EndTime,String EventDate){
        this.EventName=EventName;
        this.StartTime=StartTime;
        this.EndTime=EndTime;
        this.EventDate=EventDate;
    }
    
    public String getEventName(){
        return EventName;
    }
    
    public String getStartTime(){
        return StartTime;
    }
    
    public String getEndTime(){
        return EndTime;
    }
    
    public String getEventDate(){
        return EventDate;
    }
}

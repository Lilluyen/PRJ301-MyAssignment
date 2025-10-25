package model;

import java.util.Date;

public class RequestForLeave extends BaseModel{
//    [requestID]
//      ,[createdBy]
//      ,[createdTime]
//      ,[fromDate]
//      ,[toDate]
//      ,[reason]
//      ,[status]
//      ,[processedBy]
//      ,[processedTime]
//      ,[processNote]
    
    private Employee createdBy;
    private java.util.Date createdTime;
    private java.sql.Date fromDate;
    private java.sql.Date toDate;
    private String reason;
    private int status;
    private Employee processedBy;
    private java.util.Date processedTime;
    private String note;

    public Employee getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Employee createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public java.sql.Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(java.sql.Date fromDate) {
        this.fromDate = fromDate;
    }

    public java.sql.Date getToDate() {
        return toDate;
    }

    public void setToDate(java.sql.Date toDate) {
        this.toDate = toDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Employee getProcessedBy() {
        return processedBy;
    }

    public void setProcessedBy(Employee processedBy) {
        this.processedBy = processedBy;
    }

    public Date getProcessedTime() {
        return processedTime;
    }

    public void setProcessedTime(Date processedTime) {
        this.processedTime = processedTime;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
    
}

package org.example.wsd_teamproject.todo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TodoVO {
    private int id;
    private String title;
    private String content;
    private String category;
    private Date duedate;
    private String priority;
    private int estDur;
    private boolean completed=false;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Date getDuedate() {
        return duedate;
    }
    public String getFormattedDuedate() {
        if (duedate == null) return "";
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(duedate);
    }

    public void setDuedate(Date duedate) {
        this.duedate = duedate;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public int getEstDur() {
        return estDur;
    }

    public void setEstDur(int estDur) {
        this.estDur = estDur;
    }

    public boolean isCompleted() {
        return completed;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
    }
}
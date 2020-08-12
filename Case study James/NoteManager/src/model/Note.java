package model;

public class Note {
   private int id;
   private String name;
   private String description;
   private int typeId;
   private String startTime;

    public Note() {
    }

    public Note(int id, String name, String description, int typeId, String startTime) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.typeId = typeId;
        this.startTime = startTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }
}

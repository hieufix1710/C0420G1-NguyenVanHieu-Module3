package model;

public class Service {
    private int  id;
    private  String name;
    private double area;
    private int numberOfFloors;
    private int maxPeople;
    private double feeRent;
    private int idTypeRent;
    private int idTypeService;
    private String status;

    public Service() {
    }

    public Service(int id, String name, double area, int numberOfFloors, int maxPeople, double feeRent, int idTypeRent, int idTypeService, String status) {
        this.id = id;
        this.name = name;
        this.area = area;
        this.numberOfFloors = numberOfFloors;
        this.maxPeople = maxPeople;
        this.feeRent = feeRent;
        this.idTypeRent = idTypeRent;
        this.idTypeService = idTypeService;
        this.status = status;
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

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public int getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(int numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }

    public int getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(int maxPeople) {
        this.maxPeople = maxPeople;
    }

    public double getFeeRent() {
        return feeRent;
    }

    public void setFeeRent(double feeRent) {
        this.feeRent = feeRent;
    }

    public int getIdTypeRent() {
        return idTypeRent;
    }

    public void setIdTypeRent(int idTypeRent) {
        this.idTypeRent = idTypeRent;
    }

    public int getIdTypeService() {
        return idTypeService;
    }

    public void setIdTypeService(int idTypeService) {
        this.idTypeService = idTypeService;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

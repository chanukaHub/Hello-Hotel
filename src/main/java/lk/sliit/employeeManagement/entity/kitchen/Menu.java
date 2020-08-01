package lk.sliit.employeeManagement.entity.kitchen;

import lk.sliit.employeeManagement.entity.banquet.BanquetOrder;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Menu {
    @Id
    private String menuId;
    private String name;
    private String type;
    private double unitPrice;
    @OneToMany(mappedBy = "menu", cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH, CascadeType.MERGE})
    private List<BanquetOrder> banquetOrders = new ArrayList<>();
    @ManyToMany(mappedBy = "menus")
    private List<FoodItem> foodItems = new ArrayList<>();

    public Menu() {
    }

    public Menu(String menuId, String name, String type, double unitPrice) {
        this.menuId = menuId;
        this.name = name;
        this.type = type;
        this.unitPrice = unitPrice;
    }

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public List<BanquetOrder> getBanquetOrders() {
        return banquetOrders;
    }

    public void setBanquetOrders(List<BanquetOrder> banquetOrders) {
        this.banquetOrders = banquetOrders;
    }

    public List<FoodItem> getFoodItems() {
        return foodItems;
    }

    public void setFoodItems(List<FoodItem> foodItems) {
        this.foodItems = foodItems;
    }
}
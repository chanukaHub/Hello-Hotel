package lk.sliit.employeeManagement.entity.banquet;

import lk.sliit.employeeManagement.entity.barManage.BarOrders;
import lk.sliit.employeeManagement.entity.kitchen.Menu;
import lk.sliit.employeeManagement.entity.reservation.Customer;

import javax.persistence.*;
import java.sql.Date;

@Entity
public class BanquetOrder {
    @Id
    private String orderId;
    private String hallId;
    private String orderState;
    private double noOfPlates;
    private Date date;
    private String submittedBy;
    @OneToOne(cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH, CascadeType.MERGE})
    @JoinColumn(name = "customer", referencedColumnName = "customerId", insertable = false, updatable = false)
    private Customer customer;
    @ManyToOne(cascade = {CascadeType.PERSIST,CascadeType.REFRESH, CascadeType.DETACH, CascadeType.MERGE})
    @JoinColumn(name="menu",referencedColumnName = "menuId", insertable = false, updatable = false)
    private Menu menu;
    @OneToOne(cascade = {CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.DETACH, CascadeType.MERGE})
    @JoinColumn(name = "banquetBill", referencedColumnName = "billId", insertable = false, updatable = false)
    private BanquetBill banquetBill;

    public BanquetOrder(String orderId, String hallId,
                        String orderState, double noOfPlates, Date date, String submittedBy) {
        this.orderId = orderId;
        this.hallId = hallId;
        this.orderState = orderState;
        this.noOfPlates = noOfPlates;
        this.date = date;
        this.submittedBy = submittedBy;
    }

    public BanquetOrder() {
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getHallId() {
        return hallId;
    }

    public void setHallId(String hallId) {
        this.hallId = hallId;
    }

    public String getOrderState() {
        return orderState;
    }

    public void setOrderState(String orderState) {
        this.orderState = orderState;
    }

    public double getNoOfPlates() {
        return noOfPlates;
    }

    public void setNoOfPlates(double noOfPlates) {
        this.noOfPlates = noOfPlates;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getSubmittedBy() {
        return submittedBy;
    }

    public void setSubmittedBy(String submittedBy) {
        this.submittedBy = submittedBy;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }

    public BanquetBill getBanquetBill() {
        return banquetBill;
    }

    public void setBanquetBill(BanquetBill banquetBill) {
        this.banquetBill = banquetBill;
    }
}
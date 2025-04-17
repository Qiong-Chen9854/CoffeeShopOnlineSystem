package com.techelevator.model;

import java.util.Objects;

public class menuItems {
    private int itemId;
    private String name;
    private String description;
    private double price;
    private int categoryId;
    private int stockQuantity;

    public menuItems() {
    }

    public menuItems(int itemId, String name, String description, double price, int categoryId, int stockQuantity) {
        this.itemId = itemId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.categoryId = categoryId;
        this.stockQuantity = stockQuantity;
    }

    public int getItemId() {
        return itemId;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        menuItems menuItems = (menuItems) o;
        return itemId == menuItems.itemId && Double.compare(menuItems.price, price) == 0 && categoryId == menuItems.categoryId && stockQuantity == menuItems.stockQuantity && Objects.equals(name, menuItems.name) && Objects.equals(description, menuItems.description);
    }

    @Override
    public int hashCode() {
        return Objects.hash(itemId, name, description, price, categoryId, stockQuantity);
    }

    @Override
    public String toString() {
        return "menuItems{" +
                "itemId=" + itemId +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", categoryId=" + categoryId +
                ", stockQuantity=" + stockQuantity +
                '}';
    }
}

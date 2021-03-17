package Goods;

public class Goods {
    
    
    private String name;
    private int price;
    private int number; //수량
    
    
    public Goods(String name, int price, int number) {
        this.name = name;
        this.price = price;
        this.number = number;
    }

    
    public String getName() {
        return name;
    }
    
    public int getPrice() {
        return price;
    }

    public int getNumber() {
        return number;
    }
    
    @Override
    public String toString() {
        return "[" + name +", " + price + "원, " + number + "개" + "]";
    }
}

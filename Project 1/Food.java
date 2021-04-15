package Project;

import java.io.Serializable;

public class Food implements Serializable {
    private String foodName; //음식이름
    private int price;  //음식가격
    private static final long serialVersionUID = 3L; // 직렬화 시리얼 넘버

    public Food(String foodName, int price) {
        this.foodName = foodName;
        this.price = price;
    }
    
    public int getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return "[음식 = " + this.foodName + " 가격 = " + this.price + "]";
    }
}
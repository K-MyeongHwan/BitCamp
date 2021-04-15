package Project;

import java.io.Serializable;
import java.util.List;

public class Customer implements Serializable {
    private String id;  //구매자 아이디
    private int money;  //구매자 돈(가입시 10만원)
    private List<Food> orderList; // 주문목록
    private static final long serialVersionUID = 3L; // 직렬화 시리얼 넘버

    //생성자별로 기능을 구분
    public Customer(String id) { //회원 가입시에 쓰는 생성자
        this.id = id;
        this.money = 100000;
    }

    public Customer(String id, int money) { //회원정보 갱신에 쓰는 생성자
        this.id = id;
        this.money = money;
    }

    public String getId() {
        return id;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "Customer [id=" + id + ", money=" + money + ", orderList=" + orderList + "]";
    }
}
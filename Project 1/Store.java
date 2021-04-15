package Project;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Store implements Serializable{
    private String name;
    private List<Food> menu;
    private static final long serialVersionUID = 3L; // 직렬화 시리얼 넘버
    //가게는 비트이츠 내부적으로 생성된다
    public Store(String storeName) {
        this.name = storeName;
        this.menu = new ArrayList<Food>();
    }
    //메뉴에 담기
    public void addMenu(Food food) {
        this.menu.add(food);
    }
    //menu ArrayList에 담긴 Food객체들을 print하는 메소드
    public void getMenu() {
        for(int i = 0; i < menu.size(); i++) {
            System.out.print( i + 1 + "번 메뉴 : ");
            System.out.println(menu.get(i));
        }
    }

    public Food getFood(int index) {
        return menu.get(index);
    }

    @Override
    public String toString() {
        return name;
    }


}

package Goods;
public class mainClass {
    public static void main(String[] args) {
        Goods goods1 = new Goods("키보드",70000,1);
        Goods goods2 = new Goods("노트북",2000000,1);
        Goods goods3 = new Goods("마우스",16000,1);
        Goods goods4 = new Goods("모니터",30000,2);
        Goods goods5 = new Goods("이어폰",19000,3);
        
        Goods[] ComputerProducts = 
        new Goods[] {goods1,goods2,goods3,goods4,goods5};
        
        Goods[] coffees = 
        new Goods[] {new Goods("아메리카노",1500,2),new Goods("카푸치노",4500,1), new Goods("초코라떼",5000,3)};
        

        for(Goods goods : ComputerProducts) {
            System.out.println(goods);
        }
        
        System.out.println("--------------------------------------------");
        
        for(Goods goods : coffees) {
            System.out.println(goods);
        }
        
        System.out.println("--------------------------------------------");
        
        //ComputerProducts를 통해서 goods3의 가격을 뽑아보세요
        System.out.println(ComputerProducts[2].getPrice());
        //coffees를 통해서 카푸치노의 가격을 뽑아보세요
        System.out.println(coffees[1].getPrice());
    }
}

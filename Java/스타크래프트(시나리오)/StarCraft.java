package StarCraft;

interface Irepairable{}

// 유닛들의 부모클래스
class Unit{
    
    int hitpoint; //현재hp
    final int MAX_HP; //maxhp
    
    
    Unit(int hp){ //클래스에서 return 값이 없다 > return type , 클래스이름하고 같아야된다. (함수)
        this.MAX_HP = hp;
    }
    
    
}

// 지상 유닛
class GroundUnit extends Unit{
    GroundUnit(int hp) {
        super(hp); //상속관계에서, 부모클래스가 오버로딩생성자를 만들었다면, 자식클래스에서 부모클래스의 오버로딩생성자를 실행해주어야하는데, super
    }
}

// 공중 유닛
class AirUnit extends Unit{
    AirUnit(int hp) {
        super(hp);
    }
}

// 건물
class CommandCenter implements Irepairable{
    
}

//지상 유닛 세분화
class Tank extends GroundUnit implements Irepairable{
    Tank() { //default 생성자 
        super(50);
        this.hitpoint = this.MAX_HP;
    }
    
    @Override
    public String toString() {
        return "Tank";
    }
}

class Marine extends GroundUnit{
    Marine() {
        super(50);
        this.hitpoint = this.MAX_HP;
    }
    @Override
    public String toString() {
        return "Marine";
    }
}

class Scv extends GroundUnit implements Irepairable{
    Scv() {
        super(50);
        this.hitpoint = this.MAX_HP;
    }
    @Override
    public String toString() {
        return "Scv";
    }
    // 다른 유닛들을 치료하는 함수
    // 단, GroundUnit의 자식 셋 중 둘,
    // 그리고 GroundUnit과 관계 없는 CommandCenter의 주소값을 파라미터로 받을 수 있어야 한다
    // 그래서 implements Irepairable 사용
    void repair(Irepairable repairunit) {
        
        // Unit 타입인 것과 아닌 것으로 한 번 거른다
        if(repairunit instanceof Unit) {
            Unit unit = (Unit)repairunit;
            // Unit의 부모타입이라 할 수 있는 인터페이스 Irepairable는 아무 자원이 없다
            // 즉 자식자원인 hp를 못 봄 그래서 볼 수 있도록 다운캐스팅 해준다
            
            if(unit.hitpoint != unit.MAX_HP) {
                unit.hitpoint = unit.MAX_HP;
                System.out.println(repairunit.toString()+"의 수리가 완료되었습니다.");
            }
            
        } else {
            // 여긴 Irepairable 타입의 repairunit이 Unit의 인스턴스가 아닌 것
            // 즉 CommandCenter처럼 Irepairable을 implements했지만 Unit 클래스와 관계 없는 자원이 들어온다
            System.out.println("Unit타입이 아닙니다. 다른 방법으로 수리하세요.");
        }
    }
    
}


public class StarCraft {
    public void main(String[] args) {
        Tank tk = new Tank();
        Marine m = new Marine();
        Scv scv = new Scv();
        GroundUnit groundUnit = new GroundUnit(100);
        // 전투
    }

}

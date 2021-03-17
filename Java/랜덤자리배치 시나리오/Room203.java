import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

/*
우리 강의실은 가로 4, 세로 7로 총 28 자리가 되어있다.
각 자리는 형, 누나들이 있다.
형, 누나들이 이름이 들어있는 ArrayList이 있다고 할 때 ( I/O 공부도 하고싶으면 배치한 후 loc을 텍스트파일로 빼보자. )
각 자리들에 랜덤으로 자리를 부여해볼까요?

1. 메뉴화면출력함수
=============!자리 랜덤 배치!=============
= 1. 자리섞기                           
= 2. 자리확인                           
= 3. 자리 초기화                        
= 4. 프로그램 종료                       
======================================

2. 자리섞기함수 (랜덤배치)

3. 자리확인함수 (자리출력)

4. 자리초기화함수

ex)
--배치전
[__] [__] [__] [__] 
[__] [__] [__] [__] 
[__] [__] [__] [__] 
[__] [__] [__] [__] 
[__] [__] [__] [__] 
[__] [__] [__] [__] 
[__] [__] [__] [__] 

--배치후
[김명환] [하준수] [이승준] [박선희] 
[현상진] [이광희] [조하선] [오주환] 
[정아인] [이동근] [김현진] [안승주] 
[임나영] [이상엽] [백보성] [서태희] 
[김대업] [김진아] [이보희] [이가희] 
[김영허] [김영훈] [박주현] [김수연] 
[문형철] [정수빈] [한석희] [__] 

아래에는 예시 ...
아래에는 예시 ...
아래에는 예시 ...
.
.
.
.
 */
public class Room203 {
    private final int HOR;
    private final int VER;
    private List<String> students;
    private String[][] loc;
    private Scanner scanner;

    public Room203() {
        HOR = 4;
        VER = 7;
        students = new ArrayList<String>();
        scanner = new Scanner(System.in);
        students.add("김명환");
        students.add("김대업");
        students.add("김수연");
        students.add("김영훈");
        students.add("김진아");
        students.add("김현진");
        students.add("문형철");
        students.add("박선희");
        students.add("박주현");
        students.add("백보성");
        students.add("서태희");
        students.add("정아인");
        students.add("안승주");
        students.add("김영허");
        students.add("이가희");
        students.add("이광희");
        students.add("이동근");
        students.add("이보희");
        students.add("이상엽");
        students.add("이승준");
        students.add("임나영");
        students.add("정수빈");
        students.add("조하선");
        students.add("하준수");
        students.add("한석희");
        students.add("현상진");
        students.add("오주환");

        loc = new String[VER][HOR];
        for (int i = 0; i < VER; i++) {
            for (int j = 0; j < HOR; j++) {
                loc[i][j] = "[__]";
            }
        }

        menu();
    }

    public void menu() {
        while (true) {
            System.out.println("=============!자리 랜덤 배치!=============");
            System.out.println("= 1. 자리섞기                           ");
            System.out.println("= 2. 자리확인                           ");
            System.out.println("= 3. 자리 초기화                        ");
            System.out.println("= 4. 프로그램 종료                       ");
            System.out.println("======================================");
            int menuChoice = scanner.nextInt();

            switch (menuChoice) {
            case 1:
                replace();
                break;
            case 2:
                seeplace();
                break;
            case 3:
                resetplace();
                break;
            case 4:
                System.out.println("시스템이 종료됩니다.");
                System.exit(1);
            }
        }
    }

    public void replace() {
        int persons = students.size();
        int[] randoms = new int[persons];
        for(int i=0;i<randoms.length;i++) {
            //int[]의 default값이 0이기 때문에, 28로 값을 넣어주어서, 0번째사람도 자리를 섞이게 해준다.
            //전부 28로 값을 넣어주지 않으면, 0번째사람이 맨마지막에 들어가게된다.
            randoms[i] = 28;
        }
        int random = (int) (Math.random() * persons);
        int k = 0;
        String[] studentList = new String[persons];
        for (int i = 0; i < persons; i++) {
            studentList[i] = students.get(i);
        }

        for (int i = 0; i < randoms.length; i++) {
            for (int j = 0; j < randoms.length; j++) {
                if (random == randoms[j]) {
                    random = (int) (Math.random() * persons);
                    j = -1;
                }
            }
            randoms[i] = random;
        }

        for (int i = 0; i < VER; i++) {
            for (int j = 0; j < HOR; j++) {
                if (k < persons) {
                    loc[i][j] = "[" + studentList[randoms[k++]] + "]";
                }
            }
        }

        System.out.println("자리가 재배정 되었습니다.");
    }

    public void seeplace() {
        for (int i = 0; i < VER; i++) {
            for (int j = 0; j < HOR; j++) {
                System.out.print(loc[i][j] + " ");
            }
            System.out.println();
        }
        System.out.println();
    }

    public void resetplace() {
        for (int i = 0; i < VER; i++) {
            for (int j = 0; j < HOR; j++) {
                loc[i][j] = "[__]";
            }
        }
        System.out.println("자리가 초기화되었습니다.");
    }

}

package Project;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

public class BitEats implements Serializable {
    private HashMap<String, String> users;  //회원가입 및 로그인에 쓰이는 id, password가 들어갈 해쉬맵
    private List<Store> storeList; // 가게들을 담는 리스트
    private BitEats bitstores;  //BitEats가 생성되었을때 만들어진 store들을 가지고있는 bitstores
    private List<Food> orderList;   // Food 객체가 들어가는 주문목록
    private Customer currentCustomer; // 현재 로그인되어있는 사용자
    private static final long serialVersionUID = 3L;
    //사용하는 폴더 경로
    private final String loginInfoPath = "C:\\BitEats\\LoginInfo";
    private final String customersPath = "C:\\BitEats\\Customers";
    private final String storePath = "C:\\BitEats\\Store";
    private final String orderHistoryPath = "C:\\BitEats\\OrderHistory";
    //File화 해서 폴더경로 유무를 확인하는 checkFileExists(File f) 메소드에 쓰이는 File들
    private File loginPathToFile;
    private File customerPathToFile;
    private File storePathToFile;
    private File orderHistoryPathToFile;

    public void boot() {  //BitEats 시작 명령어
        write(); //가게목록을 쓰는 메소드
        int choice = 9;
        while (choice != 0) {
            Scanner scanner = new Scanner(System.in);

            System.out.println("안녕하세요 비트이츠 서비스 입니다. 명령어를 입력해주세요");
            System.out.println("1. 회원가입 2. 로그인 0. 종료");
            choice = scanner.nextInt();
            switch (choice) {
                case 1 :
                    System.out.println("회원가입을 진행합니다.");
                    join();
                    break;
                case 2 :
                    System.out.println("로그인을 진행합니다.");
                    login();
                    break;
                case 0 :
                    System.out.println("이용해주셔서 감사합니다.");
                    break;
                default :
                    System.out.println("유효하지 않은 명령어입니다. 다시 확인해주세요");
                    break;
            }
        }
    }

    //프로그램 사용에 필요한 경로가 있는지 확인 후 없으면 만들어주는 메소드
    public void checkFileExists(File f) {
        if(!f.exists() || !f.isDirectory()) {
            System.out.println("디렉토리가 없는것을 발견했습니다. 디렉토리를 생성합니다.");
            if(f.mkdirs()) {
                System.out.println("디렉토리를 생성했습니다.");
            } else {
                System.out.println("디렉토리 생성 실패! 관리자에게 문의해주세요.");
            }
        } else {
            return;
        }
    }
    //회원가입 기능
    public void join() {
        checkFileExists(loginPathToFile); //경로 체크 메소드 실행
        checkFileExists(customerPathToFile); //경로 체크 메소드 실행
        Scanner scanner = new Scanner(System.in);

        System.out.println("비트이츠 회원가입 시스템입니다!!");
        System.out.println("아이디를 입력해주세요");
        String id = scanner.nextLine();
        System.out.println("비밀번호를 입력해주세요");
        String password = scanner.nextLine();

        //ID 중복 확인 코드
        File[] files = loginPathToFile.listFiles();
        List<String> ids = new ArrayList<String>();

        for(int i = 0; i < files.length; i++) {
            ids.add(files[i].getName()); // 파일명들을 ids배열의 인덱스에 넣는다
            if( ids.get(i).equals(id+".txt") ) {  // id와 일치하는 값이 있을 경우
                System.out.println("이미 가입된 아이디입니다.\n메인으로 돌아갑니다.\n");
                return; //반복문 종료
            }
        }
        // 중복이 아니라면 아이디와 비밀번호를 각각 키와 밸류로 지정해 해쉬맵에 넣는다
        this.users = new HashMap<>();
        this.users.put(id, password);

        //LoginInfo 객체를 직렬화하여 write한다. LoginInfo는 id와 password 대조에 쓰임
        LoginInfo temp = new LoginInfo(id, users);

        //Customer 경로에는 가입한 id를 이름으로 가지는 회원정보 저장
        String filename = customersPath + "\\" + id + ".txt";

        FileOutputStream fos = null;
        BufferedOutputStream bos = null;
        ObjectOutputStream out = null;

        try {
            fos = new FileOutputStream(filename);
            bos = new BufferedOutputStream(fos);
            out = new ObjectOutputStream(bos);

            Customer customer = new Customer(id);

            out.writeObject(customer);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                out.close();
                bos.close();
                fos.close();
            } catch (Exception e2) {

            }
        }
        System.out.println("회원가입이 완료되었습니다!");
        // 직렬화가 끝난 후 다음을 회원가입을 위해 temp를 비운다
        temp = null;


    }
    //로그인 기능
    public void login() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("비트이츠 로그인 시스템입니다!!");
        System.out.println("아이디를 입력해주세요");
        String id = scanner.nextLine();
        System.out.println("비밀번호를 입력해주세요");
        String password = scanner.nextLine();

        String filename = loginInfoPath + "\\" + id + ".txt";

        FileInputStream fis = null;
        BufferedInputStream bis = null;
        ObjectInputStream in = null;

        try {
            fis = new FileInputStream(filename);
            bis = new BufferedInputStream(fis);
            in = new ObjectInputStream(bis);

            LoginInfo loginInfo = (LoginInfo) in.readObject(); //LoginInfo로 다운캐스팅

            if (loginInfo.getLogin().get(id).equals(password)) { //아이디와 키값이 같다면 로그인 성공
                System.out.println("로그인을 성공했습니다!");
                setCurrentCustomer(id); //로그인한 사용자를 저장한다.
                showMeTheMoney();       //로그인 성공시 인사와 잔액을 보여준다.
                showOrderHistory();     //최근 주문 목록을 보여준다.
                showStore();            //가게 목록을 보여준다.
                storeMenu();            //가게 메뉴를 보여준다.
                System.out.println("주문이 완료되었습니다! \n이용해주셔서 감사합니다!!");
                System.exit(0); //프로그램 종료
            } else {
                System.out.println("비밀번호가 틀립니다!!\n메인으로 돌아갑니다.");
            }

        } catch (FileNotFoundException fn) {
            System.out.println("해당 아이디가 존재하지 않습니다.\n메인으로 돌아갑니다.");
        } catch (IOException ioe) {
            System.out.println(ioe.getMessage());
        } catch (ClassNotFoundException cnfe) {
            System.out.println(cnfe.getMessage());
        } finally {
            try {
                in.close();
                bis.close();
                fis.close();
            } catch (Exception e3) {

            }
        }
    }
    //최초 접속시 잔액 알려주는 메소드
    public void showMeTheMoney() {
        System.out.printf("환영합니다 %s님 , 잔액 : %d 원을 가지고 계십니다.\n", this.currentCustomer.getId(), this.currentCustomer.getMoney());
    }
    //로그인 성공시 Customer 경로에서 Customer객체를 불러와 역직렬화로 재조립한다
    public void setCurrentCustomer(String id) {

        String path = "C:\\BitEats\\Customers\\" + id + ".txt";

        FileInputStream fis = null;
        BufferedInputStream bis = null;
        ObjectInputStream in = null;

        try {
            fis = new FileInputStream(path); //파일이름불러오고
            bis = new BufferedInputStream(fis); //불러온걸 버퍼로옮기고
            in = new ObjectInputStream(bis); //버퍼로 옮긴걸 조립한다

            Customer customer = (Customer) in.readObject();
            this.currentCustomer = customer; // 로그인 성공이후부터 비트이츠 이용자는 customer로 기능을 사용

        } catch (FileNotFoundException fn) { //로그인 파일을 못찾으면
            System.out.println("해당 아이디가 존재하지 않습니다.\n메인으로 돌아갑니다.");
        } catch (IOException ioe) {
            System.out.println(ioe.getMessage());
        } catch (ClassNotFoundException cnfe) {
            System.out.println(cnfe.getMessage());
        } finally {
            try {
                in.close();
                bis.close();
                fis.close();
            } catch (Exception e3) {

            }
        }
    }
    //Store 객체를 파라미터로 받아 for문으로 내용을 순서대로 출력해서 메뉴 구현
    public void showMenu(Store s) {
        s.getMenu();
    }
    //BitEats의 상점 목록을 호출하는 메소드
    public void storeMenu() {
        String storeName = "";
        Scanner scanner = new Scanner(System.in);
        System.out.println("가게를 선택해주세요.");
        int choice = scanner.nextInt();
        switch(choice) {    //choice 번호에 따라 가게를 선택해 ordering 메소드를 호출한다
            case 1: storeName = "아빠곰 돈까스";
                System.out.printf("%s에 오신 것을 환영합니다.\n", storeName);
                ordering(choice, storeName);
                return;

            case 2: storeName = "덕자네방앗간";
                System.out.printf("%s에 오신 것을 환영합니다.\n", storeName);
                ordering(choice, storeName);
                return;

            case 3: storeName = "꿀맛김밥";
                System.out.printf("%s에 오신 것을 환영합니다.\n", storeName);
                ordering(choice, storeName);
                return;

            case 4: storeName = "피자나라치킨공주";
                System.out.printf("%s에 오신 것을 환영합니다.\n", storeName);
                ordering(choice, storeName);
                return;

            default : System.out.println("잘못 입력하셨습니다.\n");
                return;
        }
    }
    //ordering메소드는 선택한 가게의 메뉴를 보여주고 장바구니에 담아 결제하는것까지 구현한 메소드
    public void ordering(int choice, String storeName) {
        Scanner scanner = new Scanner(System.in);
        int foodNumber = -1;
        int totalPrice = 0;
        System.out.println("=======================================");
        while(foodNumber != 0 ) {   //0번을 누르면 결제
            showMenu(storeList.get(choice-1));  //음식목록을 보여준다
            System.out.println("원하시는 메뉴를 선택해주세요.\n선택한 메뉴를 결제하시려면 0을 입력해주세요.");
            foodNumber = scanner.nextInt();
            if (foodNumber == 0) {  // 만약 0번을 눌렀다면 결제로 넘어감
                if(currentCustomer.getMoney() < totalPrice) { //가지고 있는 돈이 결제금액보다 적다면 메뉴 초기화
                    System.out.println("가지고 있는 돈이 결제금액 보다 적습니다. 메뉴를 초기화합니다.");
                    this.orderList.clear(); //잔액부족으로 결제실패시 담은음식 초기화
                    ordering(choice, storeName); //다시 음식을 고른다
                    break;
                } else {    //결제금액이 충분할경우
                    this.currentCustomer.setMoney(this.currentCustomer.getMoney() - totalPrice); //사용자의 돈에서 결제된다
                    System.out.printf("결제가 완료되었습니다! 결제금액 %d원, 잔액 %d원\n" , totalPrice ,this.currentCustomer.getMoney());
                    saveLoginInfo(); //Customer경로에 있는 회원정보 파일이 갱신된다
                    Ordered o = new Ordered(this.orderList, storeName, totalPrice, currentCustomer.getId()); //주문내역생성
                    o.saveOrderHistory(o); //가장 최근 주문내역을 저장한다.
                    break;
                }
            }
            selectMenu(choice, foodNumber); //0번을 누르기 전까지는 계속 selectMenu 메소드로 음식을 담는다
            totalPrice = getOrderList();
        }

    }
    //최근 주문을 보여주는 showOrderHistory 메소드
    public void showOrderHistory() {
        //현재 로그인한 사용자의 아이디를 이용하여 파일이름을 정한다
        String filename =  orderHistoryPath + "\\" + currentCustomer.getId() + ".txt";

        FileInputStream fis = null;
        BufferedInputStream bis = null;
        ObjectInputStream in = null;

        try {
            fis = new FileInputStream(filename);
            bis = new BufferedInputStream(fis);
            in = new ObjectInputStream(bis); // 역직렬화 코드
            //Ordered 객체로 다운캐스팅하여 정상적으로 읽어준다
            Ordered ordered = (Ordered) in.readObject();

            System.out.println(ordered);

        } catch (FileNotFoundException fe) { //아직 주문목록이 없을경우는 첫 주문
            System.out.println("첫 번째 주문이시네요! 앞으로도 많이많이 이용해주세요 ~^ ^");
        } catch (EOFException eofe) {
            System.out.println("끝 " + eofe.getMessage());
        } catch (IOException ioe) {
            System.out.println(ioe.getMessage());
        } catch (ClassNotFoundException cnfe) {
            System.out.println(cnfe.getMessage());
        } finally {
            try {
                in.close();
                bis.close();
                fis.close();
            } catch (Exception e) {
                // TODO: handle exception
            }
        }
    }
    //주문완료시 회원정보 갱신하는 메소드
    public void saveLoginInfo () {
        String filename = customersPath + "\\" + this.currentCustomer.getId() + ".txt"; // 객체를 직렬화해서 write

        FileOutputStream fos = null;
        BufferedOutputStream bos = null;
        ObjectOutputStream out = null;

        try {
            fos = new FileOutputStream(filename);
            bos = new BufferedOutputStream(fos);
            out = new ObjectOutputStream(bos);

            Customer customer = new Customer(currentCustomer.getId(), currentCustomer.getMoney());

            out.writeObject(customer);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                out.close();
                bos.close();
                fos.close();
            } catch (Exception e2) {

            }
        }
    }

    public void selectMenu(int choice, int foodNumber) {
        this.orderList.add(getStoreList().get(choice - 1).getFood(foodNumber - 1));
    }

    // 가게 목록 불러오기 메소드
    public void showStore() {

        String filename0 = storePath + "\\storelist.txt";

        FileInputStream fis = null;
        BufferedInputStream bis = null;
        ObjectInputStream in = null;

        try {
            fis = new FileInputStream(filename0);
            bis = new BufferedInputStream(fis);
            in = new ObjectInputStream(bis); // 역직렬화 코드

            BitEats storelist = (BitEats) in.readObject();
            this.bitstores = storelist;

            for (int i = 0; i < storelist.getStoreList().size(); i++) {
                System.out.print(i + 1 + " : ");
                System.out.println(storelist.getStoreList().get(i));
            }

        } catch (FileNotFoundException fe) {
            System.out.println("파일이 존재하지 않습니다.");
        } catch (EOFException eofe) {
            System.out.println("끝 " + eofe.getMessage());

        } catch (IOException ioe) {
            System.out.println(ioe.getMessage());

        } catch (ClassNotFoundException cnfe) {
            System.out.println(cnfe.getMessage());

        } finally{

            try {
                in.close();
                bis.close();
                fis.close();
            } catch (Exception e) {
                // TODO: handle exception
            }

        }
    }
    //가게목록 호출하는 getter메소드
    public List<Store> getStoreList() {
        return storeList;
    }
    //장바구니에 음식 담을 때마다 담긴 목록을 보여주는 메소드
    public int getOrderList() {
        int totalprice = 0;
        System.out.println("=======현재까지 담긴 음식=======");
        for(int i = 0; i < this.orderList.size(); i++) {
            System.out.println(this.orderList.get(i));
            totalprice += this.orderList.get(i).getPrice();
        }
        System.out.println("총 결제금액 : " + totalprice);
        System.out.println("==============================");
        return totalprice;
    }
    //프로그램 시작시 가게목록을 생성하는 메소드
    public void write() {
        String path = this.storePath + "\\" + "storelist.txt";

        FileOutputStream fos = null;
        BufferedOutputStream bos = null;
        ObjectOutputStream oos = null;

        try {
            fos = new FileOutputStream(path);
            bos = new BufferedOutputStream(fos);
            oos = new ObjectOutputStream(bos);
            //직렬화 대상 bit
            BitEats bit = new BitEats();

            oos.writeObject(bit);

        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {

            try {
                oos.close();
                bos.close();
                fos.close();
            } catch (Exception e2) {
                // TODO: handle exception
            }

        }

    }

    public BitEats() {

        loginPathToFile = new File(this.loginInfoPath);
        customerPathToFile = new File(this.customersPath);
        storePathToFile = new File(this.storePath);
        orderHistoryPathToFile = new File(this.orderHistoryPath);

        checkFileExists(storePathToFile);
        checkFileExists(orderHistoryPathToFile);

        storeList = new ArrayList<Store>();
        orderList = new ArrayList<Food>();

        //BitEats가 생성되면 가게들 정보가 자동으로 생성됨

        Store store001 = new Store("아빠곰돈까스");
        Store store002 = new Store("덕자네 방앗간");
        Store store003 = new Store("꿀맛 김밥");
        Store store004 = new Store("피자나라 치킨공주");

        storeList.add(store001);
        storeList.add(store002);
        storeList.add(store003);
        storeList.add(store004);

        Food food000 = new Food("로스안심까스", 8500);
        Food food001 = new Food("치즈돈까스", 9000);
        Food food002 = new Food("떡볶이", 4000);
        Food food003 = new Food("왕돈까스", 6000);
        Food food004 = new Food("새우김밥", 4500);
        Food food005 = new Food("참치김밥", 4000);
        Food food006 = new Food("더블포테이토피자", 15000);
        Food food007 = new Food("콤비네이션피자", 12000);

        store001.addMenu(food000);
        store001.addMenu(food001);
        store002.addMenu(food002);
        store002.addMenu(food003);
        store003.addMenu(food004);
        store003.addMenu(food005);
        store004.addMenu(food006);
        store004.addMenu(food007);
    }
}

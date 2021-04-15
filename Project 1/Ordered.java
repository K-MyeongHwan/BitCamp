package Project;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Ordered implements Serializable {
    //구매자의 주문목록
    private List<Food> food;
    //가게이름
    private String storeName;
    //총 가격
    private int totalPrice;
    //구매자 아이디
    private String customerId;
    private final String orderHistoryPath = "C:\\BitEats\\OrderHistory";
    private static final long serialVersionUID = 3L;

    public String getOrderHistoryPath() {
        return orderHistoryPath;
    }

    public Ordered(List<Food> food, String storeName, int totalPrice, String customerId) {  //구매내역 발생하면 바로 파일로 저장됩니다
        this.storeName = storeName;
        this.food = new ArrayList<Food>();
        this.food = food;
        this.totalPrice = totalPrice;
        this.customerId = customerId;
    }
    public void saveOrderHistory(Ordered o) {
        String filename = orderHistoryPath + "\\" + this.customerId + ".txt"; // 객체를 직렬화해서 write

        FileOutputStream fos = null;
        BufferedOutputStream bos = null;
        ObjectOutputStream out = null;

        try {
            fos = new FileOutputStream(filename, false); //append
            bos = new BufferedOutputStream(fos);
            out = new ObjectOutputStream(bos);


            out.writeObject(o); // 분해해서 Userdata.txt 에 쓴다
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

    public int getTotalPrice() {
        return totalPrice;
    }

    @Override
    public String toString() {

        return "************구매내역************" + "\n" +
               "- 구매자 아이디: " + this.customerId + "\n"+
               "- 가게 이름: " + this.storeName + "\n"+
               "- 주문음식: " + food +"\n" +
               "- 총 가격: " + this.totalPrice +
               "\n****************************";
    }
}

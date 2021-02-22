package MyStack;

public class MyStack {
    
    int maxsize;
    int pointer;
    Object[] objarr;
    
    MyStack(int maxsizze){
        
        this.maxsize = maxsize;
        objarr = new Object[maxsize];
        pointer = -1;
        
    }
    
    public boolean isEmpty() {
        
        return pointer == -1;
        
    }
    
    public boolean isFull() {
        return pointer == maxsize-1;
    }
    
    public void push(Object o) {
        
        if(isFull()) {
            System.out.println("배열이 이미 꽉 찼습니다");
        } else {
            objarr[++pointer] = o;
        }       
        
    }
    
    public Object peek() {
        
        if(isEmpty()) {
            throw new IndexOutOfBoundsException(pointer);
        } else {
            return objarr[pointer];
        }
    }
    
    public Object peek(int i) {
        Object value;
        value = objarr[i-1];
        return value;
    }
    
    public Object pop() {
        Object obj = peek();
        pointer--;
        return obj;
    }
    
    

    
}

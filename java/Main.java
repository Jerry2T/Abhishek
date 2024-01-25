import java.util.Scanner;
public class Main{
   public static void main(String args[]){
        Scanner sc = new Scanner(System.in);   
        System.out.print("Enter Number: ");
        int n = sc.nextInt();
        int count = 0;            
        for(int i=1;i<=n;i++){
            int j = i;  
            if(j%8 == 0 || j == n){
                while(j > 0){
                    int last = j%10;
                    if(last == 6 || last == 8){
                        count++;
                    }
                    j /= 10;
                }
            }
        }
        System.out.println(count); 
    }
}
import java.util.Scanner;

public class Assn2 {
    public static void main(String arr[]){
        Scanner sc=new Scanner(System.in);        
        System.out.print("Enter no.1: ");
        long ano=sc.nextInt();
        System.out.print("Enter no.2: ");
        long bno=sc.nextInt();
        long res=multi(ano,bno);
        long result=adds(res);
        System.out.println("Final ans: "+result);
    }

    public static long multi(long a,long b){
        long ans=1;
        for(long i=a;i<b;i++){
            ans*=i;
        }
        return ans;
    }

    public static int adds(long a){
        int sum=0;
        while(a>0){
            sum+=a%10;
            a/=10;
        }
        while(a>=10){
            sum=adds(sum);
        }
        return sum;
    }
}
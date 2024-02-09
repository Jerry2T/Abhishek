import java.util.Scanner;
import java.math.BigInteger;

public class assn3{
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.print("Enter first number: ");
        BigInteger a = new BigInteger(scan.next());
        System.out.print("Enter second number: ");
        BigInteger b = new BigInteger(scan.next());
        BigInteger product = BigInteger.ONE;

        for(BigInteger i=a;i.compareTo(b)<=0;i=i.add(BigInteger.ONE)){
            product = product.multiply(i);
        }
        BigInteger ten = BigInteger.TEN;

        while(product.compareTo(ten)>0){            
            BigInteger num = product;
            BigInteger ans = BigInteger.ZERO;
            while(num.compareTo(BigInteger.ZERO)>0){
                BigInteger [] rem = num.divideAndRemainder(ten);
                BigInteger remainder = rem[1];
                ans = ans.add(remainder);
                num = rem[0];
            }
            product = ans;            
        }
        System.out.println(product);
        scan.close();
    }
}
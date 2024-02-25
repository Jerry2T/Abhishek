import java.util.Scanner;
import java.lang.Math;

abstract class Shape{
	float fArea;
	float fPerimeter;
	String sColor;
	abstract void accept();
	abstract void calcArea();
	abstract void calcPerimeter();
	abstract void setColor();
	public void printCalculated(){
		System.out.println("\nArea of the Shape is:"+fArea);
		System.out.println("\nPerimeter of the Shape is:"+fPerimeter);
		System.out.println("\nColor of the Shape is:"+sColor);
	}
}

class Rectangle extends Shape{
	Scanner sc=new Scanner(System.in);	
	
    void accept(){
		System.out.print("\nEnter the length of a Rectangle:");
		int iLength=sc.nextInt();
		System.out.print("\nEnter the breadth of a Rectangle:");
		int iBreadth=sc.nextInt();
	}
	void calcArea(){
		fArea=0;
		fArea=iLength*iBreadth;
	}
	void calcPerimeter(){
		fPerimeter=0;
		fPerimeter=(iLength*2)+(iBreadth*2);
	}
	void setColor(){
		System.out.print("\nEnter the Color of a Rectangle:");
		sColor=sc.next();
	}
}

class Circle extends Shape{
	Scanner sc=new Scanner(System.in);

	void accept(){
		System.out.print("\nEnter the radius of a Circle:");
		int iRadius=sc.nextInt();
	}
	void calcArea(){
		fArea=0;
		fArea=3.14*iRadius*iRadius;
	}
	void calcPerimeter(){
		fPerimeter=0;
		fPerimeter=2*3.14*iRadius;
	}
	void setColor(){
		System.out.print("\nEnter the Color of a Circle:");
		sColor=sc.next();
	}
}

class Triangle extends Shape{
	Scanner sc=new Scanner(System.in);	
	
    void accept(){
		System.out.print("\nEnter the Base of a Triangle:");
		int iBase=sc.nextInt();
		System.out.print("\nEnter the Height of a Triangle:");
		int iHeight=sc.nextInt();
		/*System.out.print("\nEnter the sides of a Triangle:");
		int s1=sc.nextInt();
		System.out.print("\nEnter the sides of a Triangle:");
		int s2=sc.nextInt();
		System.out.print("\nEnter the sides of a Triangle:");
		int s3=sc.nextInt();*/
	}
    void calcArea(){
		fArea=0;
		fArea=0.5*iBase*iHeight;
	}		
	void calcArea(float side1, float side2, float side3){        
        float s = (side1 + side2 + side3) / 2;        
        fArea = Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
    }
	void calcPerimeter(){
		fPerimeter=0;
		fPerimeter=3*iBase;
	}
	void setColor(){
		System.out.println("\nEnter the Color of a Triangle:");
		sColor=sc.next();
	}
}

public class Assn6{
	public static void main(String args[]){
		Scanner sc=new Scanner(System.in);
		int iCh,choice;
		do{
            System.out.println("\n1.Rectangle\t2.Circle\t3.Triangle");
            System.out.print("\nEnter which shape you want:");
            iCh=sc.nextInt();
            switch(iCh){
                case 1: Rectangle rec=new Rectangle();
                        rec.accept();
                        rec.calcArea();
                        rec.calcPerimeter();
                        rec.setColor();
                        rec.printCalculated();
                        break;
                case 2: Circle cir=new Circle();
                        cir.accept();
                        cir.calcArea();
                        cir.calcPerimeter();
                        cir.setColor();
                        cir.printCalculated();
                        break;
                case 3: Triangle tri=new Triangle();
                        //tri.accept();
                        tri.calcArea(3,4,5);
                        tri.calcPerimeter();
                        tri.setColor();
                        tri.printCalculated();
            }
            System.out.println("\nContinue?1 for YES/0 for NO:");
            iDoCh=sc.nextInt();
		}while(choice==1);
	}
}
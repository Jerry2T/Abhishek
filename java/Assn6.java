import java.util.Scanner;
import java.lang.Math;

abstract class Shape{
	double dArea;
	double dPerimeter;
	String sColor;
	abstract void accept();
	abstract void area();
	abstract void perimeter();
	abstract void setColor();
	public void calculate(){
		System.out.println("\nArea of the Shape is: "+dArea);
		System.out.println("\nPerimeter of the Shape is: "+dPerimeter);
		System.out.println("\nColor of the Shape is: "+sColor);
	}
}

class Rectangle extends Shape{
	Scanner sc=new Scanner(System.in);	
	int iLength,iBreadth;
    void accept(){
		System.out.print("\nEnter the length of a Rectangle:");
		iLength=sc.nextInt();
		System.out.print("\nEnter the breadth of a Rectangle:");
		iBreadth=sc.nextInt();
	}
	void area(){		
		dArea=iLength*iBreadth;
	}
	void perimeter(){		
		dPerimeter=(iLength*2)+(iBreadth*2);
	}
	void setColor(){
		System.out.print("\nEnter the Color of a Rectangle:");
		sColor=sc.next();
	}
}

class Circle extends Shape{
	Scanner sc=new Scanner(System.in);
    int iRadius;
	void accept(){
		System.out.print("\nEnter the radius of a Circle:");
		iRadius=sc.nextInt();
	}
	void area(){		
		dArea=3.14*iRadius*iRadius;
	}
	void perimeter(){		
		dPerimeter=2*3.14*iRadius;
	}
	void setColor(){
		System.out.print("\nEnter the Color of a Circle:");
		sColor=sc.next();
	}
}

class Triangle extends Shape{
	Scanner sc=new Scanner(System.in);	
	int iHeight,iBase,s,s1,s2,s3;
    void accept(){
		System.out.print("\nEnter the Base of a Triangle:");
		iBase=sc.nextInt();
		System.out.print("\nEnter the Height of a Triangle:");
		iHeight=sc.nextInt();
		/*System.out.print("\nEnter the sides of a Triangle:");
		s1=sc.nextInt();
		System.out.print("\nEnter the sides of a Triangle:");
		s2=sc.nextInt();
		System.out.print("\nEnter the sides of a Triangle:");
		s3=sc.nextInt();*/
	}
    void area(){		
		dArea=0.5*iBase*iHeight;
	}		
	void area(double side1, double side2, double side3){        
        double s = (side1 + side2 + side3) / 2;        
        dArea = Math.sqrt(s * (s - side1) * (s - side2) * (s - side3));
    }
	void perimeter(){
		dPerimeter=3*iBase;
	}
	void setColor(){
		System.out.print("\nEnter the Color of a Triangle:");
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
                        rec.area();
                        rec.perimeter();
                        rec.setColor();
                        rec.calculate();
                        break;
                case 2: Circle cir=new Circle();
                        cir.accept();
                        cir.area();
                        cir.perimeter();
                        cir.setColor();
                        cir.calculate();
                        break;
                case 3: Triangle tri=new Triangle();
                        tri.accept();
                        tri.area();
                        tri.perimeter();
                        tri.setColor();
                        tri.calculate();
            }
            System.out.println("\nContinue?1 for YES/0 for NO:");
            choice=sc.nextInt();
		}while(choice==1);
	}
}
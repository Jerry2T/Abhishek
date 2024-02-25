public class Assn5{
	public void finalize(){
		System.out.println("Object is garbage collected "+this.toString());
	}
	public static void main(String args[]){
		Assn5 s1 = new Assn5();
		Assn5 s2 = new Assn5();
		System.out.println("s1 : " + s1.toString() + " and s2 : " + s2.toString());
		s1 = null;
		s2 = null;
		System.gc();		
	}
}
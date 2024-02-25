import java.util.Scanner;

class CricketPlayer{
    private String name;
    private int age;
    private int runs;
    private String team;
    private String role;
    
    public void setter(String name,int age,String team,int runs,String role){
        this.name = name;
        this.age = age;
        this.team = team;
        this.role = role;
        this.runs= runs;
    }
    
    public int getAge(){ return age; }    
    public int getRuns(){ return runs; }    
    public String getName(){ return name; }
    public String getTeam(){ return team; }
    public String getRole(){ return role; }
}

public class Assn4{
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        String name,team,role;
        int num,runs,age;
        System.out.print("Enter the number of players: ");
        num = sc.nextInt();
        sc.nextLine(); 
        
        CricketPlayer[] players = new CricketPlayer[num];
        for(int i=0;i<num;i++){
            System.out.println("\nEnter details for player " + (i + 1) + ": ");
            CricketPlayer player = new CricketPlayer();
            System.out.print("Enter player name: ");
            name=sc.nextLine();
            System.out.print("Enter player age: ");
            age=sc.nextInt();
            sc.nextLine(); 
            System.out.print("Enter player team: ");
            team=sc.nextLine();
            System.out.print("Enter player runs: ");
            runs=sc.nextInt();
            sc.nextLine(); 
            System.out.print("Enter player role: ");
            role=sc.nextLine();
            player.setter(name, age, team, runs, role);
            players[i] = player;
        }
        
        System.out.println("\nPlayer Information:");
        for (CricketPlayer player : players) {
            System.out.println("\nName: " + player.getName()+" Age: " + player.getAge()+" Team: " + player.getTeam()+" Role: " + player.getRole());
        }
    }
}

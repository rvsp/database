import java.sql.*;
import java.util.*;

public class JdbcDemo3
{
	public static void main(String args[])
	{
		try
		{
			Scanner sc=new Scanner(System.in);
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection
			("jdbc:oracle:thin:@localHost:1521:xe","system","tiger");

		PreparedStatement pstmt=con.prepareStatement("insert into Reva values(?,?)");
			
			System.out.println("Enter Name : ");
			String name=sc.nextLine();
			
			System.out.println("Enter AGE : ");
			int age=sc.nextInt();
			
			pstmt.setString(2,name);
			pstmt.setInt(1,age);
			
			pstmt.execute();
			pstmt.close();
			con.close();
		}
		catch(Exception e){
			System.out.println(e);
			}

	}
}
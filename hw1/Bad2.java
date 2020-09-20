
public class Bad2 {
	 public static void main(String[] args) {
	        String dueDate = "Wednesday, May 29, 2019";
	        // Truncate the due date to be just "May 29"
	        String truncatedDueDate = dueDate.substring(11, dueDate.length() - 6);
	        

	        System.out.println("This homework is due " + truncatedDueDate + ".");
	       
	    }
	
}

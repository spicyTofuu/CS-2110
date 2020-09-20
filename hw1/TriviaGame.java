import java.util.Scanner;

// Provided by the TA staff for you to modify for HW 03!
public class TriviaGame {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        
        double hpoint = Double.NEGATIVE_INFINITY;

        System.out.println("Start game? [Y]es or [N]o");
        String answer = sc.nextLine();
        
        boolean test = true;
		if (!answer.equals("Y") || !answer.equals("N")) {
			test = false;
			if(answer.equals("Y") || answer.equals("N")) {
				test = true;
			}
		}
		while (!test) {
			System.out.println("Please input either Y or N.");
			answer = sc.next();
			if (answer.equals("Y")) {
				test = true;
			}
			else if(answer.equals("N")) {
				test = false;
				break;
			}
		}

        while (answer.equals("Y")) {
            double runningScore = 0.0;
        	System.out.println("\nWhat is your name?");
            String name = sc.nextLine();

            //Question 1
            System.out.println("\nQuestion 1: What year was Java created?");
            int yearGuess = sc.nextInt();

            if (yearGuess == 1996) {
                runningScore += 100;
                System.out.printf("Congratulations %s! You gained 100 points!\n", name);
            } else {
                int difference = Math.abs(yearGuess - 1996);
                runningScore -= difference;
                //hint: use casting to format
                System.out.printf("Sorry %s, the correct answer is 1996. You lost %d points.\n", name, difference);
            }

            //Question 2
            System.out.println("\nQuestion 2: How many mL are in a cup?");
            double cupAns = sc.nextDouble();

            if (cupAns <= 236.588 + 5 && cupAns >= 236.588 - 5) {
                runningScore += 100;
                System.out.printf("Congratulations %s! You gained 100 points!\n", name);
            } else {
                double difference = Math.abs(cupAns - 236.588);
                runningScore -= difference;
                System.out.printf("Sorry %s, the correct answer is 236.588. You lost %.2f points.\n", name, difference);
            }

            //Question 3
            System.out.println("\nQuestion 3: What was the original name of the Varsity restaurant?");
            sc.nextLine();
            String varsityAns = sc.nextLine();

            if (varsityAns.toLowerCase().equals("the yellow jacket")) {
                runningScore += 200;
                System.out.printf("Congratulations %s! You gained 200 points!\n", name);
            } else {
                System.out.printf("Sorry %s. The correct answer is \"The Yellow Jacket\".\n", name);
            }

            System.out.printf("\n%s, you got %.2f total points!\n", name, runningScore);
            
    		if (runningScore>=hpoint) {
    			hpoint = runningScore;
    		}
    		System.out.println("Your highest score is:" + hpoint + " points.\n");
    		System.out.println("Would you like to play again? [Y]es or [N]o");
    		answer = sc.next();
    		if (!answer.equals("Y") || !answer.equals("N")) {
    			test = false;
    			if(answer.equals("Y") || answer.equals("N")) {
    				test = true;
    			}
    		}

    		while(!test) {
    			System.out.println("Please input either Y or N.");
    			answer = sc.next();
    			if (answer.equals("Y")) {
    				test = true;
    			}
    			else if(answer.equals("N")) {
    				break;
    			}
    		}

        }
        if (answer.equals("N")) {
            System.out.println("\nGoodbye");
        }
    }
}

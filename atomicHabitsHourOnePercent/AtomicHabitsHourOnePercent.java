//simple incremental habit calculator on
//work done on time in java
import java.util.Scanner;

public class AtomicHabitsHourOnePercent {
	protected static Scanner sc = new Scanner(System.in);

	protected static int WriteRead(String str) {
		System.out.print(str);
		return sc.nextInt();
	}

	protected static int[] ToHourMin(int mins) {
		int hours = 0;

		while(mins >= 60) {
			mins -= 60;
			hours++;
		}

		return new int[] { hours, mins };
	}

	public static void main(String[] args) {
		System.out.println("enter time work done yesterday: ");
		int hours = WriteRead("in hours: ");
		int mins = WriteRead("in mins: ");
		sc.close();
		int endMins = ( hours * 60 ) + mins;
		int[] result = ToHourMin(endMins);
		float inc = endMins / 100;
		float more = result[1] + inc;
		System.out.println("more of: " + inc + "mins");
		System.out.println(
			"result: " + result[0] + "hours " +
			more + "mins"
		);
	}
}

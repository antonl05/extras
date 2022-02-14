//simple incremental habit calculator on
//work done on time in c#
using System;

public class AtomicHabitsHourOnePercent {
	protected static int WriteRead(string str) {
		Console.Write(str);
		return Convert.ToInt32(Console.ReadLine());
	}

	protected static int[] ToHourMin(int mins) {
		int hours = 0;

		while(mins >= 60) {
			mins -= 60;
			hours++;
		}

		return new int[] { hours, mins };
	}

	public static void Main() {
		Console.WriteLine("enter time work done yesterday: ");
		int hours = WriteRead("in hours: ");
		int mins = WriteRead("in mins: ");
		int endMins = ( hours * 60 ) + mins;
		int[] result = ToHourMin(endMins);
		float inc = endMins / 100;
		Console.WriteLine("more of: " + inc + "mins");
		Console.WriteLine(
			"result: " +
			  result[0] +
			  "hours " +

			  result[1] + inc +
			  "mins"
		);
	}
}

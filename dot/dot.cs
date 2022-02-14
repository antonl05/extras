//simple dot snake-oid terminal c#
using System;

public class Dot {
  protected static void Exit(int currX, int currY) {
  	Console.Clear();
  	Console.CursorVisible = true;
  	Console.WriteLine("x: " + currX);
  	Console.WriteLine("y: " + currY);
    Environment.Exit(0);
  }
  public static void Main() {
    if(Console.WindowHeight < 10 && Console.WindowWidth < 10) {
      Console.WriteLine("increase terminal size");
   	  Environment.Exit(1);
   	}

    int currY = Console.WindowHeight / 2;
    int currX = Console.WindowWidth / 2;
    Console.CursorVisible = false;
    Console.Clear();
    Console.SetCursorPosition(currX, currY);
    Console.Write("•");
    Console.CursorLeft--;

    try{
      while(true) {
        switch(Convert.ToString(Console.ReadKey(true).KeyChar)) {
      	  case "W": case "w":
       	    if (currY == 0) {
       	      Exit(currX, currY);
       	    }
      	    Console.Write(" ");
      	    Console.CursorTop--;
      	    Console.CursorLeft--;
       	    Console.Write("•");
            Console.CursorLeft--;
      	    currY--;
      	    break;

          case "S": case "s":
            if (currY == Console.WindowHeight) {
              Exit(currX, currY);
            }
            Console.Write(" ");
            Console.CursorTop++;
            Console.CursorLeft--;
            Console.Write("•");
            Console.CursorLeft--;
            currX++;
      	    break;

      	  case "A": case "a":
      	    if(currX == 0) {
      	      Exit(currX, currY);
      	    }
      	    Console.Write(" ");
      	    Console.CursorLeft--;
      	    Console.CursorLeft--;
       	    Console.Write("•");
      	    Console.CursorLeft--;
      	    currY++;
      	    break;

      	  case "D": case "d":
      	    if (currX == Console.WindowWidth) {
      	      Exit(currX, currY);
      	    }
      	    Console.Write(" •");
      	    Console.CursorLeft--;
      	    currX++;
      	    break;

      	  case "Q": case "q":
      	    Exit(currX, currY);
      	    break;

      	  default: break;
        }
      }
    }
    catch(Exception ex) {
      #if DEBUG
        Console.WriteLine(ex.StackTrace);
      #endif
      Exit(currX, currY);
    }
  }
}

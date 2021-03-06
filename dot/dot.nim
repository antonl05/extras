#simple dot snake-oid terminal
import terminal

let
  x = terminalWidth()
  y = terminalHeight()

if y < 10 and x < 10:
  echo "increase terminal size"
  quit QuitFailure

var
  currX = int x / 2
  currY = int y / 2

hideCursor()
eraseScreen()
setCursorPos currX, currY
stdout.write "•"
cursorBackward()

while true:
  case getch():
    of 'W', 'w':
      block:
       if currY == 0: break
       stdout.write " "
       cursorUp()
       cursorBackward()
       stdout.write "•"
       cursorBackward()
       dec currY
    of 'S', 's':
      block:
       if currY == y: break
       stdout.write " "
       cursorDown()
       cursorBackward()
       stdout.write "•"
       cursorBackward()
       inc currY
    of 'a', 'A':
      block:
       if currX == 0: break
       stdout.write " "
       cursorBackward()
       cursorBackward()
       stdout.write "•"
       cursorBackward()
       dec currX
    of 'd', 'D':
      block:
       if currX == x: break
       stdout.write " •"
       cursorBackward()
       inc currX
    of 'q', 'Q':
      eraseScreen()
      setCursorPos 0, 0
      showCursor()
      echo "X: ", currX
      echo "Y: ", currY
      quit()
    else: discard

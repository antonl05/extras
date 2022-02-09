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

proc boole(): bool =
  currX == 0 or currY == 0 or currX == x or currY == y

while true:
  case getch():
    of 'W', 'w':
      block:
       if boole(): break
       stdout.write " "
       cursorUp()
       cursorBackward()
       stdout.write "•"
       cursorBackward()
       dec currY
    of 'S', 's':
      block:
       if boole(): break
       stdout.write " "
       cursorDown()
       cursorBackward()
       stdout.write "•"
       cursorBackward()
       inc currY
    of 'a', 'A':
      block:
       if boole(): break
       stdout.write " "
       cursorBackward()
       cursorBackward()
       stdout.write "•"
       cursorBackward()
       dec currX
    of 'd', 'D':
      block:
       if boole(): break
       stdout.write " "
       stdout.write "•"
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

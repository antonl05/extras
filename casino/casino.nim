import random, strutils

randomize()
var life = 10
var bet: int

while life > 0:
  stdout.write "enter bet: "
  try:
    bet = parseInt readLine stdin

  except ValueError:
    echo "enter number"
    quit QuitFailure

  let chance = rand 1..6

  if bet notin 1..6:
    echo "enter 1..6"
    quit QuitFailure

  echo "chance: ", chance
  if bet == chance:
    echo "damn"
    life += 3

  else:
    echo "nope"
    dec life

  echo "life: ", life

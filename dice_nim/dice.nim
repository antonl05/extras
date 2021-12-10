import random,os,strutils,macros

proc exit(txt:string) =
 echo txt
 quit QuitFailure

proc canParse(seq:seq[string]):int =
  for f in seq:
    try: return parseInt f
    except: continue
  exit "cant canParse - no number?"

macro ech(args: varargs[untyped]): untyped =
 result = newTree nnkStmtList
 var e = 1
 for n in args:
  result.add newCall("echo", newLit(e), newLit(": "), n)
  inc e

const help = """give arguments to prove probability
    --dice: roll dice
    --coin: roll coin
    --log: see percentage
    --no-log: dont see percentage
this is GPLv3
(c) @antonl05"""

var param = commandLineParams()
if param == @[] or param.contains("--help"):
 exit help

if param.contains("--log") and param.contains("--no-log"):
 exit "cant have log and noLog"

if param.contains("--dice") and param.contains("--coin"):
 exit "cant have dice and coin"

randomize()

if param.contains("--dice"):
 var un,tu,tri,fore,fiv,sx = 0
 var paramTotal = canParse(param) - 1
 var ee = 0

 for f in 0 .. paramTotal:
   for x in 0 .. int paramTotal / 1000:
     case rand 1..6
      of 1: inc un
      of 2: inc tu  
      of 3: inc tri
      of 4: inc fore
      of 5: inc fiv
      of 6: inc sx
      else: discard
   if param.contains("--log") and not(param.contains("--no-log")):
    inc ee
    echo (ee / paramTotal) * 100

 ech un,tu,tri,fore,fiv,sx
 var tot = un + tu + tri + fore + fiv + sx
 echo "probability of each: "
 ech un/tot, tu/tot, tri/tot, fore/tot, fiv/tot, sx/tot


if param.contains("--coin"):
 var un,tu = 0
 var paramTotal = canParse(param) - 1

 var ee = 0

 for f in 0 .. paramTotal:
   for x in 0 .. int(paramTotal / 1000):
     case rand 1..2
      of 1: inc un
      of 2: inc tu  
      else: discard
   if param.contains("--log") and not(param.contains("--no-log")):
    inc ee
    echo (ee / paramTotal) * 100

 ech un,tu
 var tot = un + tu
 echo "probability of each: "
 ech un/tot, tu/tot

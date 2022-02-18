include prelude
import chroma
import random
import math
import fidget

loadFont("IBM Plex Sans", "IBMPlexSans-Regular.ttf")
loadFont("IBM Plex Sans Bold", "IBMPlexSans-Bold.ttf")

randomize()

proc generateColor(): seq[float] =
  var gen_clr: seq[float]
  for i in 0..3:
    gen_clr.add(round(rand(0.0..1.0), 2))
  return gen_clr

proc generateRandomColors(num: int): seq[Color] =
  var 
    clr: seq[float]
    random_clrs: seq[Color]
  for i in 0..num:
    clr = generateColor()
    random_clrs.add(color(clr[0], clr[1], clr[2], clr[3]))
  return random_clrs


# Generate colors
var 
  all_colors: seq[Color]

all_colors = generateRandomColors(3)


proc drawMain() =
  frame "main":
    box 0, 0, 670, 420
    fill "#ffffff"
    layoutAlign laStretch
    group "Group 1":
      box 137, 283, 281, 38
      layoutAlign laStretch
      text "Export Pallete":
        box 173, 10, 88, 18
        constraints cCenter, cMax
        fill "#ffffff"
        font "IBM Plex Sans", 12, 400, 0, hCenter, vCenter
        characters "Export Pallete"
        layoutAlign laStretch
      rectangle "Rectangle 6":
        box 154, 0, 127, 38
        constraints cCenter, cMax
        fill "#222020"
        stroke "#ffffff"
        cornerRadius 4
        strokeWeight 2
        layoutAlign laStretch
      text "Generate Pallete":
        box 20, 10, 102, 18
        constraints cCenter, cMax
        fill "#222020"
        font "IBM Plex Sans", 12, 400, 0, hCenter, vCenter
        characters "Generate pallete"
        layoutAlign laStretch
      rectangle "Rectangle 5":
        box 0, 0, 142, 38
        constraints cCenter, cMax
        fill "#ffffff"
        onHover:
          fill "#cccccc"
        onClick:
          all_colors = generateRandomColors(3)
        cornerRadius 4
        layoutAlign laStretch
    text "#FFFFFF":
      box 101, 218, 64, 18
      constraints cStretch, cMax
      fill "#000000"
      font "IBM Plex Sans", 12, 400, 0, hCenter, vCenter
      characters all_colors[0].toHtmlHex()
      layoutAlign laStretch
    text "#2C1552":
      box 389, 218, 64, 18
      constraints cStretch, cMax
      fill "#ffffff"
      font "IBM Plex Sans", 12, 400, 0, hCenter, vCenter
      characters all_colors[1].toHtmlHex()
      layoutAlign laStretch
    rectangle "Rectangle 4":
      box 354, 10, 134, 241
      constraints cStretch, cStretch
      fill all_colors[0].toHtmlHex()
      cornerRadius 4
      layoutAlign laStretch
    text "#ACCAD3":
      box 245, 218, 64, 18
      constraints cStretch, cMax
      fill "#000000"
      font "IBM Plex Sans", 12, 400, 0, hCenter, vCenter
      characters all_colors[2].toHtmlHex()
      layoutAlign laStretch
    rectangle "Rectangle 3":
      box 210, 10, 134, 241
      constraints cStretch, cStretch
      fill all_colors[1].toHtmlHex()
      cornerRadius 4
      layoutAlign laStretch
    rectangle "Rectangle 2":
      box 66, 10, 134, 241
      constraints cStretch, cStretch
      fill all_colors[2].toHtmlHex()
      cornerRadius 4
      layoutAlign laStretch
    rectangle "Rectangle 1":
      box 0, 0, 555, 359
      constraints cStretch, cStretch
      fill "#222020"
      layoutAlign laStretch


when isMainModule:
  startFidget(drawMain, w = 670, h = 420)

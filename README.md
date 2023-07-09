# DrawRectangle
Simple Reshade shader that draws a rectangle, colored w/ alpha.
## Usage
I made this to place rectangle and darken UI elements so my OLED don't burn up on games with bright static UI elements. <br>
I didn't want to use a picture overlay shader because it's static, and Prod-80's Magical_Rectangle.fx breaks SpecialK HDR Retrofit. <br>
It's a super simple pixel shader, so it can be a ReShade coding guide of sorts too I guess.
## Installation
- ReShade: https://reshade.me/
- Put DrawRectangle.fx into reshade-shaders/Shaders
  - Spam copy paste to get more rectangle layers

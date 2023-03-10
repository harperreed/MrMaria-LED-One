# Mr Maria LED One replacement

I got the Mr Maria Miffy thing quite awhile ago. Recently it tumbled down and the power plug broke. I decided to replace the LED with a neopixel ring and use an ESP32 to control it. 

I generated a model using openscad and then used WLED to make it work. 

## The Model

The first thing i did was ask ChatGPT to generate the parts for me. ;-) It kind of worked.  I had to make some changes to the generated parts to make it actually work.

I used the [ESP32 D1 Mini Case](https://www.printables.com/model/224998-esp32-d1-mini-case) as the case for the ESP32. It is merged into the base to support the ESP32 Mini NodeMCU. It is a great model. 

## Parts

- [Mini NodeMCU](https://www.amazon.com/gp/product/B08L79192D?ie=UTF8&th=1&linkCode=ll1&tag=harperrules0d-20&linkId=8e5886b8856f4fc89c3dd59202867634&language=en_US&ref_=as_li_ss_tl)
- [NeoPixel Ring - 12 x 5050 RGBW LEDs](https://www.adafruit.com/product/2852)
- a bit of wire
- Print the STL 
  - I used printathing.com cuz it is really nice and works super well. 

## Software

I am using [WLED]() cuz it is awesome and works super well. I recommend it. 


## Assembly

I don't actually remember the wiring - i just used whatever adafruit recommended and made it happen. lol. 

# ChatGPT

I have been using Chat GPT to do a lot of random code generation around openscad. it "works." haha. You need to do a LOT of coaching to get it to do what you want. I had the most success when i used it to generate small parts that I then weaved together. 
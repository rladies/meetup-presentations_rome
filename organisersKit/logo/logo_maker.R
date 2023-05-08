#############################################
# HOW TO MAKE R-LADIES ROME LOGO HEXSTICKER
#############################################

# This is to change the font:
# library(showtext)
# ## Loading Google fonts (http://www.google.com/fonts)
# font_add_google("", "")
# ## Automatically use showtext to render text for future devices
# showtext_auto()

setwd("R-Ladies/RLadiesRome/logo")

# Load necessary libraries
library(ggplot2)
library(cowplot)

# Start drawing the logo
p <- ggdraw()+
  draw_image("baseRlogo.png",scale=2.2,y=0.43)+
  draw_image("coloseum.png",scale=0.3,y=0.8,x=0.1)
  
## Make the hexSticker
hexSticker::sticker(p, 
                    package="Ladies Rome", 
                    p_x = 1,
                    p_y = 0.48,
                    p_size=18, 
                    s_x=1, 
                    s_y=.75, 
                    s_width=1.5, 
                    s_height=1,
                    p_color = "#88398a", 
                    h_fill = "white", 
                    h_color = "#88398a",
                    dpi = 320,
                    #p_family = "", 
                    filename="base_logo.png")

# this reduces the size of the image to fit on Twitter:
ggdraw()+
  draw_image("base_logo.png")
ggsave("logo.png", width = 4.5,height = 4.5)

# magick::image_read("logo.png")
# rstudioapi::restartSession()


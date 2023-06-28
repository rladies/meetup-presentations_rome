#############################################
# HOW TO MAKE R-LADIES ROME LOGO HEXSTICKER
#############################################

# This is to change the font:
# library(showtext)
# ## Loading Google fonts (http://www.google.com/fonts)
# font_add_google("", "")
# ## Automatically use showtext to render text for future devices
# showtext_auto()

setwd("~/Documents/R/R_general_resources/R-Ladies/RLadiesRome/meetup-presentations_rome/organisersKit/logo")

# Load necessary libraries
library(ggplot2)
library(cowplot)

# Start drawing the logo
p <- ggdraw()+
  draw_image("baseRlogo-rmbg.png",scale=2.2,y=0.43)+
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
                    white_around_sticker = FALSE,
                    filename="base_logo.png")

# this reduces the size of the image to fit on Twitter:
ggdraw()+
  draw_image("base_logo.png")
ggsave("logo.png", width = 4.5,height = 4.5,bg=NA)


# rstudioapi::restartSession()




# write a SVG logo
library(magick)

# Read in the PNG image
png_image <- image_read("base_logo.png")

# Convert the PNG image to SVG format
svg_image <- image_convert(png_image, format = "svg")

# Save the SVG image to a file
image_write(svg_image, "output.svg")


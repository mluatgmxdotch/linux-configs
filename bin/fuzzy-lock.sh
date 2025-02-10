#!/bin/sh -e

rm /tmp/screen_locked_*.png || true
rm /tmp/screen_locked.png || true

# Take a screenshot
scrot /tmp/screen_locked.png

# Grayscale with a yellow tint
convert /tmp/screen_locked.png -colorspace gray -brightness-contrast -30x10  -fill wheat -tint 120 /tmp/screen_locked.png

# Pixellate it 10x
mogrify -scale 10% -scale 1000% /tmp/screen_locked.png

# Lock screen displaying this image.
i3lock -i /tmp/screen_locked.png


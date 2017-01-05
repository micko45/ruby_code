require 'curses'    


Curses.init_pair(1, Curses::COLOR_RED, Curses::COLOR_BLUE)
Curses.attrset(Curses.color_pair(1) | Curses::A_BLINK)
Curses.addstr("Hello World")

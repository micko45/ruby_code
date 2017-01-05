require 'curses'

Curses.init_screen
begin
  x = Curses.cols / 2  # We will center our text
  y = Curses.lines / 2
  Curses.setpos(y, x)  # Move the cursor to the center of the screen
Curses.init_pair(1, Curses::COLOR_RED, Curses::COLOR_BLUE)
Curses.attrset(Curses.color_pair(1) | Curses::A_BLINK)
Curses.addstr("Hello World")

#  Curses.addstr("Hello World")  # Display the text
  Curses.refresh  # Refresh the screen
  Curses.getch  # Waiting for a pressed key to exit
ensure
  Curses.close_screen
end

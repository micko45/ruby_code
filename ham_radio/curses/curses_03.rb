require 'curses'

Curses.init_screen
begin
  win = Curses.stdscr
  x = win.maxx / 2
  y = win.maxy / 2
  win.setpos(y, x)
string = win.getstr
  win.setpos((y -2), x)
  win.addstr(string)
  win.refresh
  win.getch
ensure
  Curses.close_screen
end

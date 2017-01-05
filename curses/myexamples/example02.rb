require 'ncurses'
include Ncurses

begin
  Ncurses.initscr
  Ncurses.raw
  Ncurses.keypad(stdscr, TRUE)
  Ncurses.noecho
  Ncurses.printw("Type any character")
  ch = Ncurses.getch

  if ch == "KEY_F(2)"
    Ncurses.printw("F2 pressed")
  else 
    Ncurses.printw("\nThe pressed key is ")
    Ncurses.attron(A_BOLD)
    Ncurses.printw("%c", ch)
    Ncurses.attroff(A_BOLD)
  end
    
  Ncurses.refresh
  Ncurses.getch
ensure
  Ncurses.endwin
end

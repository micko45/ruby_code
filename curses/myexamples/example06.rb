require 'ncurses'
include Ncurses

begin
  Ncurses.initscr  #Start curses
  Ncurses.start_color #start color
  Ncurses.raw

  Ncurses.init_pair(1, COLOR_CYAN, COLOR_BLACK)
  Ncurses.printw("A Big string which i didnt care to type fully")
  Ncurses.mvchgat(0, 0, -1, A_UNDERLINE | A_BOLD, 1, 'NULL')
  Ncurses.refresh
  Ncurses.getch

ensure 

  Ncurses.endwin

end

require 'ncurses'
include Ncurses


begin
  Ncurses.initscr #start cursers
  Ncurses.raw     #enable getch to work
  Ncurses.printw("hello world") #Print hello world
  Ncurses.refresh #push buffers out to screen
  Ncurses.getch   #wait for user impute
ensure
  Ncurses.endwin  #exit
end

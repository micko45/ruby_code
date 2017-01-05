require 'ncurses'
include Ncurses

mesg = "Enter a string"
row = []
col = []
str = String.new

begin
  Ncurses.initscr
  Ncurses.getmaxyx(stdscr, row, col)
  Ncurses.mvprintw(row[0] / 2, mesg.length / 2, "%s", mesg)
  Ncurses.getstr(str)
  Ncurses.mvprintw((row[0] /2) +2 , 0, "you entered: #{str}")
  Ncurses.getch

sleep 2.4

ensure
  Ncurses.endwin
end

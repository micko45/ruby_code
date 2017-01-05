require 'ncurses'
include Ncurses

mesg = "Just a string"
row = []
col = []

begin
  Ncurses.initscr
  Ncurses.getmaxyx(stdscr, row, col)
  Ncurses.mvprintw(row[0] / 2, mesg.length / 2, "%s", mesg)
  Ncurses.mvprintw(row[0] - 2, 0, "This screen has %d rows and %d columns\n", row[0], col[0])
  Ncurses.printw("Try to resize your window(if possible) and then run this program again")
  Ncurses.refresh
  Ncurses.getch

sleep 2.4

ensure
  Ncurses.endwin
end

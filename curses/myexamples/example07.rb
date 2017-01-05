require 'ncurses'
include Ncurses


Ncurses.initscr
Ncurses.cbreak
Ncurses.keypad(stdscr, TRUE)

begin
  height = 3
  width = 10
  starty = (Ncurses.LINES - height) / 2
  startx = (Ncurses.COLS - width) / 2
  Ncurses.printw("Press a key to continue")
  Ncurses.refresh
  ch = Ncurses.getch

  my_win = Ncurses.newwin(height, width, starty, startx)
  while ch != Ncurses::KEY_F2 do
    case ch
      when Ncurses::KEY_LEFT
        startx = startx - 1
        Ncurses.delwin(my_win)
        my_win = Ncurses.newwin(height, width, starty, startx)
        break
      when Ncurses::KEY_RIGHT
        startx = startx + 1
        Ncurses.delwin(my_win)
        my_win = Ncurses.newwin(height, width, starty, startx)
        break
      when Ncurses::KEY_UP
        starty = starty - 1
        Ncurses.delwin(my_win)
        my_win = Ncurses.newwin(height, width, starty, startx)
        break
      when Ncurses::KEY_DOWN
        starty = starty + 1
        Ncurses.delwin(my_win)
        my_win = Ncurses.newwin(height, width, starty, startx)
        break
    end
  end

ensure
  Ncurses.endwin

end




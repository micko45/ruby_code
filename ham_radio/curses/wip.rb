require 'curses'

Curses.init_screen
Curses.curs_set(0)  # Invisible cursor
Curses.start_color()
Curses.init_pair(1, Curses::COLOR_WHITE, Curses::COLOR_BLUE)


begin

  # Building a static window

#wintop
wintop = Curses::Window.new( 1, Curses.cols, 0, 0)
wintop.setpos(1, 1)
#wintop.attrset(Curses.color_pair(1) | Curses::A_STANDOUT)
wintop.bkgd(Curses.color_pair(1))
wintop.addstr("logger")
wintop.refresh

#Win1
  topcolumns = ((Curses.cols.to_f / 100) * 75).to_i
  win1 = Curses::Window.new(3, topcolumns, 1, 0)
  win1.box("|", "-")
  win1.setpos(1, 1)
  win1.addstr("hello")
  win1.refresh

  # In this window, there will be an animation
  win2 = Curses::Window.new(Curses.lines / 2 - 1, Curses.cols / 2 - 1, 
                            Curses.lines / 2, Curses.cols / 2)
  win2.box("|", "-")
  win2.refresh
  2.upto(win2.maxx - 3) do |i|
    win2.setpos(win2.maxy / 2, i)
    win2 << "*"
    win2.refresh
    sleep 0.05 
  end

  # Clearing windows each in turn
#  sleep 0.5 
  wintop.clear
  wintop.refresh
  wintop.close
#  sleep 0.5 
  win1.clear
  win1.refresh
  win1.close
#  sleep 0.5
  win2.clear
  win2.refresh
  win2.close
#  sleep 0.5
rescue => ex
  Curses.close_screen
end

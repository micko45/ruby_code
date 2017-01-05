#!/bin/env ruby

require 'ncurses'
include Ncurses

file = ARGV[0]
if ARGV.length < 1
  puts "./command <filename>\n"
  exit 1
end

begin
  row = col = []
  y = x = []
#Ncurses decleration 
  Ncurses.initscr
  Ncurses.getmaxyx(stdscr, row, col)
  Ncurses.raw #required for pause after getch, cbreak would also do. 

  File.open(file, 'r') do |f|
    prev = String.new
    f.each_char do |ch| 
      Ncurses.getyx(stdscr, y, x)
      if y[-2] == (row[0] - 1) 
         Ncurses.printw("<-Press Any Key->")
         Ncurses.getch
	 Ncurses.clear
	 Ncurses.move(0,0)
      end
      if prev == '/' && ch == '*'
        Ncurses.attron(A_BOLD)
        Ncurses.getyx(stdscr, y, x)
	Ncurses.move(y[0], x[0] - 1)
        Ncurses.printw("%c", ch)
      else 
        Ncurses.printw("%c", ch)
      end
      Ncurses.refresh()
      if prev == '*' && ch == '/'
        Ncurses.attroff(A_BOLD)
      end
      prev = ch.to_s
    end
  end
  Ncurses.getch
ensure
  Ncurses.endwin
end

#!/usr/bin/env ruby 
s = $stdin.gets.chomp


def vowel_count(s)
  if s =~ /[aeiouy]/
    count

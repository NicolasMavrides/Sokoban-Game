require "console_splash"
require "colorize"
require "io/console"
require_relative 'move_fns.rb'


def get_input
$input = STDIN.getch
end


def splash_screen
intro = ConsoleSplash.new(10, 50)
intro.write_header("SOKOBAN GAME", "Nicolas Mavrides", "1", {:nameFg=>:red, :authorFg=>:red, :versionFg=>:yellow, :nameBg=>:yellow})
intro.write_center(-3, "Press Q to quit or S to start!", {:fg=>:black, :bg=>:green})
intro.write_horizontal_pattern("#", {:fg=>:black, :bg=>:yellow})
intro.write_vertical_pattern("##", {:fg=>:black, :bg=>:yellow})
intro.splash
puts " "
get_input
end


#Game variables
$won = false
$player_on_goal = false
$level_num = 1
$current_level = File.readlines "levels/level#{$level_num}.xsb"
$game_complete = false


#Determine position of player on level
def player_pos(level)
  for i in 0..level.length-1
    for j in 0..level[i].length-1
      if level[i][j] == '@' || level[i][j] == '+'
        return i,j
      end
    end
  end
end


def movement
  if $input == "w"
    move_up($current_level)
  elsif $input == "s"
    move_down($current_level)
  elsif $input == "a"
    move_left($current_level)
  elsif $input == "d"
    move_right($current_level)
  elsif $input=='q'
    exit
  elsif $input=='r'
    clear_screen
    $current_level = File.readlines "levels/level#{$level_num}.xsb"
    play($current_level)
  end
end


#check whether to advance to next level
def check_status(level)
  crate_count = 0
  for i in 0..level.length-1
    for j in 0..level[i].length-1
      if level[i][j] == '$'
        crate_count += 1
      end
    end
  end
  if crate_count == 0
    $level_num += 1
    if $level_num > 90
      puts("Congratulations, you have successfully completed all the levels!!")
      exit
    else
    $current_level = File.readlines "levels/level#{$level_num}.xsb"
    clear_screen
    end
  end
end

#clear screen method. Uses 2 clear fns to cover a range of operating systems
def clear_screen
  system('clear')
  system('cls')
end

#play the level
def play(level)
  puts("Welcome to Level #{$level_num}! Push all crates to the goal spaces.")
  puts(" ")
  puts(level)
  get_input
  movement
end


#begin the game
def start
  splash_screen
  if $input == 's'
   clear_screen
   play($current_level)
  end
end

start
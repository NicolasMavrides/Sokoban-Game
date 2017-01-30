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
$num = 0
$level_finished = true

current_level = File.readlines "levels/level8.xsb"
$level_map = current_level

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
    move_up($level_map)
  elsif $input == "s"
    move_down($level_map)
  elsif $input == "a"
    move_left($level_map)
  elsif $input == "d"
    move_right($level_map)
  elsif $input=='q'
    exit
  elsif $input=='r'
  end
end

#clear screen method
def clear_screen
  system('clear')
  system('cls')
end

def play
puts($level_map)
get_input
movement
end

def start
  splash_screen
  if $input == 's'
   clear_screen
   play
  end
end

start
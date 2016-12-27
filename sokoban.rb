require "console_splash"
require "colorize"
require "io/console"

#################################################################################################

def splash_screen
intro = ConsoleSplash.new(10, 50)
intro.write_header("SOKOBAN GAME", "Nicolas Mavrides", "1", {:nameFg=>:red, :authorFg=>:red, :versionFg=>:yellow, :nameBg=>:yellow})
intro.write_center(-3, "Press Q to quit or S to start!", {:fg=>:black, :bg=>:green})
intro.write_horizontal_pattern("#", {:fg=>:black, :bg=>:yellow})
intro.write_vertical_pattern("##", {:fg=>:black, :bg=>:yellow})
intro.splash
puts " "
end


def print_level  (array)
  for i in 0..array.length-1
    for j in 0..array[i].length-1
      print array[i][j]
    end
  end
end


def playerPos  (array)
  for i in 0..array.length-1
    for j in 0..array[i].length-1
      if array[i][j]=='@' then
        return i,j
      end
    end
  end
end



def startup_menu
  input = STDIN.getch
  if input == "q"
    puts "Exited"
    exit
  else if input == "s"
         puts "\n"
          puts "Started. Please select your level (1 - 50)."
           select_level
         else puts "Invalid input. Please Press Q to exit or S to start."
           startup_menu
         end
  end
end


def select_level
  x = gets.chomp.to_i #converts any character entered into an integer
  if x<1 || x>50 #then checks if that interger is within the range 1-50
    puts "Please enter a number between 1 and 50"
    select_level #loops back to select_level method
  else
    puts "You have selected level #{x}"
    level = File.readlines ("levels/level#{x}.xsb")
    system('cls')
    print_level(level)
    x,y=search(level)
    while  game_status(level)==false
    x,y,level=movement(level,x,y)
    end
    x+=1
    level = File.readlines ("levels/level#{x}.xsb")
  end
end


def movement(level,x,y)
  button=STDIN.getch
  level[x][y]=' '
  player_on_goal = false

###### FOR BUTTON W ##############################################################################
  if button == "w" then
    if level[x-1][y]==' '
      x-=1 #update player position

    elsif level[x-1][y]=='#' #if next tile is a wall, do nothing

    elsif level[x-1][y]=='$' #if next tile is a crate...
      if level[x-2][y]==' ' #and the tile after it is empty
        level[x-2][y] = '$' #then move the crate to it
        x-=1                #and update the player position
      elsif level[x-2][y]=='.' #if the tile after the crate is a goal
        level[x-2][y]=='*' #change the goal to a * sign.
        x-=1               #and update the player position
      end

    elsif level[x-1][y]=='*' #if the next tile is a goal with a crate on it...
      if level[x-2][y]==' ' #and the tile after it is empty
        level[x-2][y]=='$' #move the crate to it
        x-=1               #and update the player position
      elsif level[x-2][y]=='.' #if the tile after the goal with crate is another goal
        x-=1                   #update the player position
        level[x-2][y] = '*'    #and move the crate to the next goal
      elsif level[x-2][y]=='.' #if the tile after the goal is a wall, do nothing
      end

    elsif level[x-1][y]=='.' #if the next tile is an empty goal
      x-=1                   #update player position
      player_on_goal = true  #and set player_on_goal to true so player appears as a + sign.
    end

###### FOR BUTTON S ##############################################################################
  elsif button == "s"
    if level[x+1][y]==' '
      x+=1 #update player position

    elsif level[x+1][y]=='#' #if next tile is a wall, do nothing

    elsif level[x+1][y]=='$' #if next tile is a crate...
      if level[x+2][y]==' ' #and the tile after it is empty
        level[x+2][y] = '$' #then move the crate to it
        x+=1                #and update the player position
      elsif level[x+2][y]=='.' #if the tile after the crate is a goal
        level[x+2][y]=='*' #change the goal to a * sign.
        x+=1               #and update the player position
      end

    elsif level[x+1][y]=='*' #if the next tile is a goal with a crate on it...
      if level[x+2][y]==' ' #and the tile after it is empty
        level[x+2][y]=='$' #move the crate to it
        x+=1               #and update the player position
      elsif level[x+2][y]=='.' #if the tile after the goal with crate is another goal
        x+=1                   #update the player position
        level[x+2][y] = '*'    #and move the crate to the next goal
      elsif level[x+2][y]=='.' #if the tile after the goal is a wall, do nothing
      end

    elsif level[x+1][y]=='.' #if the next tile is an empty goal
      x+=1                   #update player position
      player_on_goal = true  #and set player_on_goal to true so player appears as a + sign.
    end

###### FOR BUTTON A ##############################################################################
  elsif button == "a"
    if level[x][y-1]==' '
      y-=1 #update player position

    elsif level[x][y-1]=='#' #if next tile is a wall, do nothing

    elsif level[x][y-1]=='$' #if next tile is a crate...
      if level[x][y-2]==' ' #and the tile after it is empty
        level[x][y-2] = '$' #then move the crate to it
        y-=1                #and update the player position
      elsif level[x][y-2]=='.' #if the tile after the crate is a goal
        level[x][y-2]='*' #change the goal to a * sign.
        y-=1               #and update the player position
      end

    elsif level[x][y-1]=='*' #if the next tile is a goal with a crate on it...
      if level[x][y-2]==' ' #and the tile after it is empty
        level[x][y-2]=='$' #move the crate to it
        y-=1               #and update the player position
      elsif level[x][y-2]=='.' #if the tile after the goal with crate is another goal
        y-=1                   #update the player position
        level[x][y-2] = '*'    #and move the crate to the next goal
      elsif level[x][y-2]=='.' #if the tile after the goal is a wall, do nothing
      end

    elsif level[x][y-1]=='.' #if the next tile is an empty goal
      y-=1                   #update player position
      player_on_goal = true  #and set player_on_goal to true so player appears as a + sign.
    end

###### FOR BUTTON D ##############################################################################
  elsif button == "d"
    if level[x][y+1]==' '
      y+=1 #update player position

    elsif level[x][y+1]=='#' #if next tile is a wall, do nothing

    elsif level[x][y+1]=='$' #if next tile is a crate...
      if level[x][y+2]==' ' #and the tile after it is empty
        level[x][y+2] = '$' #then move the crate to it
        y+=1                #and update the player position
      elsif level[x][y+2]=='.' #if the tile after the crate is a goal
        level[x][y+2]='*' #change the goal to a * sign.
        y+=1               #and update the player position
      end

    elsif level[x][y+1]=='*' #if the next tile is a goal with a crate on it...
      if level[x][y+2]==' ' #and the tile after it is empty
        level[x][y+2]=='$' #move the crate to it
        y+=1               #and update the player position
      elsif level[x][y+2]=='.' #if the tile after the goal with crate is another goal
        y+=1                   #update the player position
        level[x][y+2] = '*'    #and move the crate to the next goal
      elsif level[x][y+2]=='.' #if the tile after the goal is a wall, do nothing
      end

    elsif level[x][y+1]=='.' #if the next tile is an empty goal
      y+=1                   #update player position
      player_on_goal = true  #and set player_on_goal to true so player appears as a + sign.
    end

###### FOR BUTTON Q ##############################################################################
  elsif button=='q'
    exit

###### FOR BUTTON R ##############################################################################

  elsif button=='r'
    select_level
  end

######### WHEN A BUTTON IS PRESSED ###############################################################
  if player_on_goal == true
    level[x][y]='+' #print the player as a + sign if they are on a goal tile.
    else
    level[x][y]='@' #print the player as a @ sign if they are on an empty tile
  end
  system('cls') #clear the command screen after each movement
  print_level(level) #print the level after each movement
  return x,y,level #return new values for x,y coordinates and the level.
end

#################################################################################################

def game_status (array)
  won=true
  for i in 0..array.length-1
    for j in 0..array[i].length-1
      if array[i][j]=='$' then
        won = false
      end
    end
  end
  return won
end

#################################################################################################

#Call the main methods to initialise the game:
splash_screen
startup_menu

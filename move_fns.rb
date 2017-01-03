#Movement methods to control the movement of the player

def move_up(level)
  x = player_pos(level)[0]
  y = player_pos(level)[1]
  level[x][y] = ' '
  level[x-1][y] = "@"
  clear_screen
  play
end

def move_down(level)
  x = player_pos(level)[0]
  y = player_pos(level)[1]
  level[x][y] = ' '
  level[x+1][y] = "@"
  clear_screen
  play
end

def move_left(level)
  x = player_pos(level)[0]
  y = player_pos(level)[1]
  level[x][y] = ' '
  level[x][y-1] = "@"
  clear_screen
  play
end

def move_right(level)
  x = player_pos(level)[0]
  y = player_pos(level)[1]
  level[x][y] = ' '
  level[x][y+1] = "@"
  clear_screen
  play
end
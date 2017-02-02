#Movement methods to control the movement of the player

def move_up(level)
  x = player_pos(level)[0]
  y = player_pos(level)[1]

  if level[x-1][y] == ' '
    if level[x][y] == '@'
      level[x][y] = ' '
      level[x-1][y] = '@'
    elsif level[x][y] == '+'
      level[x][y] = '.'
      level[x-1][y] = '@'
    end

  elsif level[x-1][y] == '$'
    if level[x-2][y] == ' '
      level[x-2][y] = '$'
      level[x-1][y] = '@'
      if level[x][y] == '@'
        level[x][y] = ' '
      elsif level[x][y] == '+'
        level[x][y] = '.'
      end
    elsif level[x-2][y] == '.'
      level[x-2][y] = '*'
      level[x-1][y] = '@'
      level[x][y] = ' '
    end

  elsif level[x-1][y] == '*' && level[x-2][y] != '#' && level[x-2][y] != '*'
    if level[x][y] == '+'
      level[x][y] = '.'
    elsif level[x][y] == '@'
      level[x][y] = ' '
    end
    if level[x-2][y] == ' '
      level[x-2][y] = '$'
    elsif level[x-2][y] == '.'
      level[x-2][y] = '*'
    end
    level[x-1][y] = '+'

  elsif level[x-1][y] == '.'
    if level[x][y] == '@'
      level[x][y] = ' '
    elsif level[x][y] == '+'
      level[x][y] = '.'
    end
    level[x-1][y] = '+'
  end

  clear_screen
  check_status(level)
  play(level)
end

def move_down(level)
  x = player_pos(level)[0]
  y = player_pos(level)[1]

  if level[x+1][y] == ' '
    if level[x][y] == '@'
      level[x][y] = ' '
      level[x+1][y] = '@'
    elsif level[x][y] == '+'
      level[x][y] = '.'
      level[x+1][y] = '@'
    end

  elsif level[x+1][y] == '$'
    if level[x+2][y] == ' '
      level[x+2][y] = '$'
      level[x+1][y] = '@'
      if level[x][y] == '@'
        level[x][y] = ' '
      elsif level[x][y] == '+'
        level[x][y] = '.'
      end
    elsif level[x+2][y] == '.'
      level[x+2][y] = '*'
      level[x+1][y] = '@'
      level[x][y] = ' '
    end

  elsif level[x+1][y] == '*' && level[x+2][y] != '#' && level[x+2][y] != '*'
    if level[x][y] == '+'
      level[x][y] = '.'
    elsif level[x][y] == '@'
      level[x][y] = ' '
    end
    if level[x+2][y] == ' '
      level[x+2][y] = '$'
    elsif level[x+2][y] == '.'
      level[x+2][y] = '*'
    end
    level[x+1][y] = '+'

  elsif level[x+1][y] == '.'
    if level[x][y] == '@'
      level[x][y] = ' '
    elsif level[x][y] == '+'
      level[x][y] = '.'
    end
    level[x+1][y] = '+'
  end

  clear_screen
  check_status(level)
  play(level)
end


def move_left(level)
  x = player_pos(level)[0]
  y = player_pos(level)[1]

  if level[x][y-1] == ' '
    if level[x][y] == '@'
      level[x][y] = ' '
      level[x][y-1] = '@'
    elsif level[x][y] == '+'
      level[x][y] = '.'
      level[x][y-1] = '@'
    end

  elsif level[x][y-1] == '$'
    if level[x][y-2] == ' '
      level[x][y-2] = '$'
      level[x][y-1] = '@'
      if level[x][y] == '@'
        level[x][y] = ' '
      elsif level[x][y] == '+'
        level[x][y] = '.'
      end
      elsif level[x][y-2] == '.'
      level[x][y-2] = '*'
      level[x][y-1] = '@'
      level[x][y] = ' '
    end

  elsif level[x][y-1] == '*' && level[x][y-2] != '#' && level[x][y-2] != '*'
    if level[x][y] == '+'
      level[x][y] = '.'
    elsif level[x][y] == '@'
      level[x][y] = ' '
    end
    if level[x][y-2] == ' '
      level[x][y-2] = '$'
    elsif level[x][y-2] == '.'
      level[x][y-2] = '*'
    end
    level[x][y-1] = '+'

  elsif level[x][y-1] == '.'
    if level[x][y] == '@'
      level[x][y] = ' '
    elsif level[x][y] == '+'
      level[x][y] = '.'
    end
    level[x][y-1] = '+'
  end

  clear_screen
  check_status(level)
  play(level)
end


def move_right(level)
  x = player_pos(level)[0]
  y = player_pos(level)[1]

  if level[x][y+1] == ' '
    if level[x][y] == '@'
      level[x][y] = ' '
      level[x][y+1] = '@'
    elsif level[x][y] == '+'
      level[x][y] = '.'
      level[x][y+1] = '@'
    end

  elsif level[x][y+1] == '$'
    if level[x][y+2] == ' '
      level[x][y+2] = '$'
      level[x][y+1] = '@'
      if level[x][y] == '@'
        level[x][y] = ' '
      elsif level[x][y] == '+'
        level[x][y] = '.'
      end
    elsif level[x][y+2] == '.'
      level[x][y+2] = '*'
      level[x][y+1] = '@'
      level[x][y] = ' '
    end

  elsif level[x][y+1] == '*' && level[x][y+2] != '#' && level[x][y+2] != '*'
    if level[x][y] == '+'
      level[x][y] = '.'
    elsif level[x][y] == '@'
      level[x][y] = ' '
    end
    if level[x][y+2] == ' '
      level[x][y+2] = '$'
    elsif level[x][y+2] == '.'
      level[x][y+2] = '*'
    end
    level[x][y+1] = '+'

  elsif level[x][y+1] == '.'
    if level[x][y] == '@'
      level[x][y] = ' '
    elsif level[x][y] == '+'
      level[x][y] = '.'
    end
    level[x][y+1] = '+'
  end

  clear_screen
  check_status(level)
  play(level)
end
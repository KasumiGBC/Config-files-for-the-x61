function fish_prompt
  set fish_greeting
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l primary (set_color c48276)
  set -l normal (set_color normal)
  set -l secundary (set_color c9c1c4)

  set -l cwd (pwd | sed -e "s!^$HOME!~!g")
  # output the prompt, left to right:
  if [ (id -u) = "0" ];
    set cwd (basename $cwd)
    # display host
    echo -n -s $red (uname -n |cut -d . -f 1) " "
  else
    # display 'user'
    echo -n -s $primary (whoami) " "
  end

  # display the current directory name:
  echo -n -s $secundary $cwd $normal

  # terminate with a nice prompt char:
  if [ (id -u) = "0" ];
    set indicate '#'
  else
    set indicate '$'
  end
  echo -n -s $blue " $indicate " $normal
end

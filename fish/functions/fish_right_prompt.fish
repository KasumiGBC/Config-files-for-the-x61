function fish_right_prompt
  set -l last_status $status
  set -l red (set_color -o red)
  set -l normal (set_color c9c1c4)

  # print last exit code if nonzero:
  if test $last_status -ne 0
    set_color red
    printf '%d' $last_status
    set_color normal
  end

  # display the timestamp on the utmost right.
  echo -n -s $normal ' [' (date +%H:%M:%S) ']'
end

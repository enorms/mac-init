# []TODO: why is execution slow
# pauses after completion before return to prompt
# shift 

chg_case () { 
  usage="Usage: chg_case tolower|toupper 'to_change'"
  if [ "$#" -eq 2 ]; then   # string is arg
    if [ "$1" = "tolower" ]; then
      shift; # not in zsh ??
      printf "$*\n" | tr '[A-Z]' '[a-z]';
    elif [ "$1" = "toupper" ]; then
      shift;
      printf "$*\n" | tr '[a-z]' '[A-Z]';
    else $usage;
    fi;
  elif [ "$#" -eq 1 ]; then     # string from pipe
    if [ "$1" = "tolower" ]; then
      while read line; do
        printf "$line\n" | tr '[A-Z]' '[a-z]';
      done
    elif [ "$1" = "toupper" ]; then
      while read line; do
        printf "$line\n" | tr '[a-z]' '[A-Z]';
      done
    else $usage;
    fi;
  else  # incorrect args
    echo $usage; return;
  fi;
}

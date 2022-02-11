# Clean numbers down to straight text
# and copy to clipboard
#
# Example: $ clean 23,797
#          23797
# 
# u

clean () { 
  usage="Usage: clean_num 'to_clean'"
  action="tr -d '$, _'"
  if [ "$#" -eq 1 ]; then   # string is arg
    echo "$*" | tr -d '$, _' | pbcopy;
    # printf "$*\n" | $action;
    # printf "copied to clipboard";
  fi;
  else  # incorrect args
    echo $usage; return;
  fi;
}

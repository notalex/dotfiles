exit unless File.directory?(".git")

RED = 2
BLUE = 6
WHITE = 7

dirty = RED
untracked = BLUE
clean = WHITE

status = %x[ git status ]

case ARGV[0]
when "branch_name"
  branch_string = %x[ git branch ]
  branch_name = branch_string.match(/\* (.+)/).try &.[1]
  puts branch_name
when "branch_color_code"
  if status.match(/Changes not staged for commit/)
    puts "tput setaf #{ dirty }"
  elsif status.match(/Untracked files/)
    puts "tput setaf #{ untracked }"
  else
    puts "tput setaf #{ clean }"
  end
when "symbol_color"
  if status.match(/Changes to be committed/)
    puts "tput setaf #{ dirty }"
  else
    puts "tput setaf #{ clean }"
  end
end

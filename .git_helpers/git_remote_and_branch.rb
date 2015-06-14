require 'optparse'

def options
  @options ||= ARGV.getopts('r:', 'f')
end

def options_string
  '-f' if options['f']
end

def remote_name
  partial_remote_name = options['r']
  return :origin unless partial_remote_name

  remote_names = %x[git remote show].split("\n")
  remote_names.grep(/#{ partial_remote_name }/).first
end

def remote_branch_name
  branch = ARGV[0] || local_branch_name
  case branch
  when 'd'
    "develop"
  when 'r'
    "release"
  when 'm'
    "master"
  when 't'
    "temp"
  else
    branch
  end
end

def local_branch_name
  branch_string = %x[ git branch ]
  branch_string.slice(/\* (.+)/, 1)
end

def write_pushed_head
  file_path = "#{ Dir.pwd }/.git/pushed_head"
  current_git_head = %x[git log -1 --oneline | awk '{print $1}']
  File.open(file_path, 'w') { |f| f.write(current_git_head) }
end

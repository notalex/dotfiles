require 'optparse'

def options
  @options ||= ARGV.getopts('r:', 'f')
end

def options_string
  '-f' if options['f']
end

def remote_name
  remote_name = options['r'] || :origin
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
  branch_string.slice(/(?<=\* ).+/)
end

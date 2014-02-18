class Heroku
  def initialize(base_command, options)
    @base_command = base_command
    @options = options
  end

  def execute
    if heroku_apps.length > 1
      puts 'Select app:'

      heroku_apps.each_with_index do |app_name, index|
        puts "#{ index + 1 }: #{ app_name }"
      end

      puts "#{ heroku_apps.length + 1 }: All"

      user_input = get_user_input
      app_names = get_matching_app_names(user_input)

      print_content(app_names.join(' | '), false)

      app_names.each do |app_name|
        execute_command_for_app(app_name)
      end
    else
      execute_command
    end
  end

  private

  def print_content(content, add_bottom = true)
    puts '-' * content.length
    puts content
    puts '-' * content.length if add_bottom
  end

  def execute_command_for_app(app_name = nil)
    option = "-a #{ app_name }" if app_name

    execute_command(option)
  end

  def execute_command(option = nil)
    command = %[#{ @base_command } #{ @options.join(' ') } #{ option }]

    print_content(command)
    system(command)
  end

  def get_matching_app_names(user_input)
    index = user_input.to_i - 1

    if index < 0 || index > heroku_apps.length
      puts 'Incorrect entry'
      exit
    elsif index == heroku_apps.length
      heroku_apps
    else
      [heroku_apps[index]]
    end
  end

  def get_user_input
    system('stty raw -echo')
    STDIN.getc
  ensure
    system('stty -raw echo')
  end

  def heroku_apps
    return @heroku_apps if instance_variable_defined?(:@heroku_apps)

    git_config_contents = File.read('.git/config')
    @heroku_apps = git_config_contents.scan(/git@heroku.com:(.+?).git/).flatten
  end
end

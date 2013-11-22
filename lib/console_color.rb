require "console_color/version"

require 'console_color/railtie' if defined?(::Rails::Console)

module ConsoleColor
  COLORS = Hash.new("\e[33m")  # yellow
  COLORS['production'] = "\e[31m"  # red
  COLORS['development'] = "\e[32m"  # green
end

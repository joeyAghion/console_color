module ConsoleColor
  class Railtie < Rails::Railtie
    module IRBSetup
      def setup(*)
        super

        app_name = if Rails.application.class.respond_to?(:module_parent_name)
          Rails.application.class.module_parent_name
        else
          Rails.application.class.parent_name
        end
        environment = ENV.fetch('CONSOLE_COLOR_ENV', Rails.env)
        color = ConsoleColor::COLORS[environment]

        prompt = "\001#{color}\002#{app_name.downcase}:#{environment}"

        IRB.conf[:PROMPT][:RAILS_APP] = {
          PROMPT_I: "#{prompt}>\e[0m ",
          PROMPT_N: "#{prompt}>\e[0m ",
          PROMPT_S: "#{prompt}%l\e[0m ",
          PROMPT_C: "#{prompt}*\e[0m ",
          RETURN: "=> %s\n",
          AUTO_INDENT: true
        }

        IRB.conf[:PROMPT_MODE] = :RAILS_APP
      end
    end

    config.after_initialize do
      require "irb"
      class << IRB
        prepend IRBSetup
      end
    end
  end
end

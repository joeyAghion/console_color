module ConsoleColor
  class Railtie < Rails::Railtie

    config.after_initialize do

      class << IRB

        def setup_with_custom_prompt(ap_path)
          setup_without_custom_prompt(ap_path)
          prompt = "\001#{ConsoleColor::COLORS[Rails.env]}\002#{Rails.application.class.parent_name.downcase}:#{Rails.env}"
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

        alias_method_chain :setup, :custom_prompt

      end

    end

  end
end

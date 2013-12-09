module ConsoleColor
  class Railtie < Rails::Railtie

    config.after_initialize do

      class << IRB

        def setup_with_custom_prompt(ap_path)
          setup_without_custom_prompt(ap_path)
          prompt = "#{ConsoleColor::COLORS[Rails.env]}#{Rails.application.class.parent_name.downcase}:#{Rails.env}"
          IRB.conf[:PROMPT][:RAILS_APP] = {
            PROMPT_I: "\001#{prompt}>\e[0m\002 ",
            PROMPT_N: "\001#{prompt}>\e[0m\002 ",
            PROMPT_S: "\001#{prompt}%l\e[0m\002 ",
            PROMPT_C: "\001#{prompt}*\e[0m\002 ",
            RETURN: "=> %s\n"
          }
          IRB.conf[:PROMPT_MODE] = :RAILS_APP
        end

        alias_method_chain :setup, :custom_prompt

      end

    end

  end
end

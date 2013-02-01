module Capybara
  module Selenium
    Driver.class_eval do

      def browser_with_startup_actions
        browser_was_uninitialized = @browser.nil?
        browser_without_startup_actions
        # If the browser window was just opened, we focus guake.
        system('focus-guake') if browser_was_uninitialized
        @browser
      end

      alias_method_chain :browser, :startup_actions
    end
  end
end

require 'selenium-webdriver'
include Selenium::WebDriver

class OmsActions
  attr_reader :action_type
  attr_accessor :additional_message, :exit_status

  SUCCESS = 0
  FAILED = 1

  def initialize(type)
    @action_type = type
  end

  def perform_operations
    visit_oms_and_login

    begin
      click_link_and_accept_alert(link_name_from_action_type)
      display_message_and_set_status SUCCESS
    rescue
      display_message_and_set_status FAILED
    ensure
      driver.close
    end
  end

  def failed?
    exit_status == FAILED
  end

private

  def link_name_from_action_type
    action_type.gsub('-',' ').upcase
  end

  def visit_oms_and_login
    visit_oms_page
    login
  end

  def driver
    @driver ||= Driver.for(:firefox)
  end

  def click_link_and_accept_alert(text)
    delay
    link = get_link(text)
    link.click
    delay
    driver.switch_to.alert.accept
  end

  def display_message_and_set_status(code)
    self.exit_status = code
    display_message(code)
  end

  def display_message(status_code)
    %x[notify-send -i #{ icon_for(status_code) } -u critical "OMS #{ action_type } #{ status_text_for(status_code) }"]
  end

  def login
    password_field = driver.find_element(:class, 'textbox')
    password_field.send_keys('india123')
    password_field.send_keys(:enter)
  end

  def visit_oms_page
    driver.get('http://192.168.3.112/oms/default.aspx')
  end

  def get_link(text)
    driver.find_elements(:link_text, text).first
  end

  def status_text_for(code)
    code == SUCCESS ? 'success' : 'failed'
  end

  def icon_for(code)
    "/home/alex/Pictures/#{ status_text_for(code) }-icon.png"
  end

  def delay
    sleep 1
  end
end


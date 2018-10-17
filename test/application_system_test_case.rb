require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  if ENV["SELENIUM_DRIVER_URL"].present?
    driven_by :selenium, using: :chrome,
                         options: {
                             browser: :remote,
                             url: ENV.fetch("SELENIUM_DRIVER_URL"),
                             desired_capabilities: :chrome}
  elsif ENV['CHROME_HEADLESS']
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400], options: { args: ['headless'] }
  else
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  end

  if ENV['CHROME_DRIVER_PATH']
    Selenium::WebDriver::Chrome.driver_path=ENV['CHROME_DRIVER_PATH']
  end

  Rails.application.eager_load!
end

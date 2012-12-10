# https://supportbee.com/devblog/2012/07/18/using-platform-dependent-gems-rb-inotify-and-rb-fsevent/

def is_mac?
  RUBY_PLATFORM.downcase.include?("darwin")
end

def is_linux?
  RUBY_PLATFORM.downcase.include?("linux")
end

unless Rails.env.production?
  require 'rb-inotify' if is_linux?
  require 'rb-fsevent' if is_mac?
end

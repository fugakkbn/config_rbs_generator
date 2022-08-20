# frozen_string_literal: true

require 'config'
require 'rails'

Config.setup do |config|
  config.const_name = 'Settings'
  config.load_and_set_settings('config/settings.yml')
end

# frozen_string_literal: true

require 'rails'

module ConfigRbsGenerator
  class Railtie < ::Rails::Railtie
    initializer 'config_rbs_generator' do
      binding.irb
    end
  end
end

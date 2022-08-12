# frozen_string_literal: true

require_relative 'test_helper'

describe ConfigRbsGenerator do
  it 'has a version number' do
    refute_nil ::ConfigRbsGenerator::VERSION
  end

  describe '.run' do
    it 'covers all settings' do
      assert_equal <<~SETTINGS, ConfigRbsGenerator.run
        module Settings
          def self.size: () -> Integer
          def self.text: () -> String
          def self.array: () -> Array[Integer | String]
        end
      SETTINGS
    end
  end
end

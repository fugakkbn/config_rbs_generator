# frozen_string_literal: true

require_relative 'test_helper'

describe ConfigRbsGenerator::Outputs do
  describe '#add_method_definition' do
    def setup
      @outputs = ConfigRbsGenerator::Outputs.new
      @setting = [:hello, 'Hello World!']
    end

    it 'added "def hello: () -> String" at the end line' do
      assert_equal <<~TEXT, @outputs.add_method_definition(@setting)
        class Settings
          def hello: () -> String
      TEXT
    end

    describe 'case of the second element of setting is Array' do
      def setup
        @outputs = ConfigRbsGenerator::Outputs.new
        @setting = [:profile, ['Alice', 23, 'running']]
      end

      it 'added "def profile: () -> Array[String | Integer]" at the end line' do
        assert_equal <<~TEXT, @outputs.add_method_definition(@setting)
          class Settings
            def profile: () -> Array[String | Integer]
        TEXT
      end
    end
  end

  describe '#finalize' do
    def setup
      @outputs = ConfigRbsGenerator::Outputs.new
    end

    it 'added "end" at the end line' do
      assert_equal <<~TEXT, @outputs.finalize
        class Settings
        end
      TEXT
    end
  end
end

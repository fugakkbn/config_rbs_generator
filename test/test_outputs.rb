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
        module Settings
          def self.hello: () -> String
      TEXT
    end

    describe 'case of the second element of setting is Array' do
      def setup
        @outputs = ConfigRbsGenerator::Outputs.new
        @setting = [:profile, ['Alice', 23, 'running']]
      end

      it 'added "def profile: () -> Array[String | Integer]" at the end line' do
        assert_equal <<~TEXT, @outputs.add_method_definition(@setting)
          module Settings
            def self.profile: () -> Array[String | Integer]
        TEXT
      end
    end

    describe 'case of the second element of setting is Config::Options' do
      def setup
        @outputs = ConfigRbsGenerator::Outputs.new
        @setting =
          Settings.map.with_index { |s, i|
            s if i == 3
          }.compact.first
      end

      it 'section becomes self and its child elements are also generated' do
        assert_equal <<~TEXT, @outputs.add_method_definition(@setting)
          module Settings
            def self.section: () -> self
            def self.size: () -> Integer
            def self.text: () -> String
            def self.yeah: () -> self
            def self.mettya: () -> self
            def self.holiday: () -> String
            def self.paragraph: () -> Array[String]
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
        module Settings
        end
      TEXT
    end
  end
end

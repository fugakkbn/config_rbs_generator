# frozen_string_literal: true

require_relative 'config_rbs_generator/version'
require_relative 'config_rbs_generator/railtie'
require_relative '../config/initializers/config'

module ConfigRbsGenerator
  def self.run
    outputs = Outputs.new

    Settings.each do |setting|
      outputs.add_method_definition(setting)
    end

    outputs.finalize
    outputs.text
  end

  class Outputs
    attr_reader :text

    def initialize
      @text = "module #{Config.const_name}\n"
    end

    def add_method_definition(setting)
      @text += "  def self.#{setting[0]}: () -> "

      if setting[1].instance_of?(Config::Options)
        @text += "self\n"
        setting[1].each { |s| add_method_definition(s) }
        @text
      elsif setting[1].instance_of?(Array)
        convert_array_types(setting[1])
      else
        @text += "#{setting[1].class}\n"
      end
    end

    def finalize
      @text += "end\n"
    end

    private

    def convert_array_types(array)
      if array.map { |s| s.instance_of?(Config::Options) }.include?(true)
        @text += "Array[untyped]\n"
      else
        klasses = array.map(&:class).uniq
        @text += "Array[#{klasses.join(' | ')}]\n"
      end
    end
  end

  class Error < StandardError; end
end

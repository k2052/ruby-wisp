require 'execjs'
require 'wisp/source'
require 'wisp/runtime'

module Wisp
  extend Runtime

  class << self
    def compile source, options = {}
      source = source.read if source.respond_to?(:read)

      exec 'compile', source
    end

  protected
    
    def bundled_path
      File.dirname Wisp::Source.bundled_path
    end
  end

  ENV['NODE_PATH'] = "#{File.expand_path('node_modules')}:#{File.expand_path('vendor/node_modules')}:#{bundled_path}:#{ENV['NODE_PATH']}"
end

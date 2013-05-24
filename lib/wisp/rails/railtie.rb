require 'rails/engine'
require 'tilt'

module Wisp
  module Rails
    class Railtie < ::Rails::Railtie
      config.app_generators.javascript_engine :wisp

      config.before_initialize do |app|
        require 'wisp'
        Sprockets::Engines
        Sprockets.register_engine '.wisp', Wisp::Rails::WispTemplate
      end
    end

    class WispTemplate < Tilt::Template
      self.default_mime_type = 'text/javascript'

      # check to see if wisp is loaded
      def self.engine_initialized?
        defined? ::Wisp
      end

      # autoload wisp library
      def initialize_engine
        require_template_library 'wisp'
      end

      def prepare
      end

      # compile template data with ruby wisp compiler
      def evaluate scope, locals, &block
        Wisp.compile data
      end

    end
  end
end

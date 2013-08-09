##
# This should be compatible with both Padrino and Middleman
#
module Wisp
  module Padrino
    # Setup extension
    class << self
      # Once registered
      def registered(app)
        require 'wisp'
        ::Sprockets.register_engine '.wisp', Wisp::Padrino::TemplateHandler
      end
    end

    class TemplateHandler < ::Tilt::Template
      self.default_mime_type = 'application/javascript'

      @@default_bare = false

      def self.default_bare
        @@default_bare
      end

      def self.default_bare=(value)
        @@default_bare = value
      end

      # DEPRECATED
      def self.default_no_wrap
        @@default_bare
      end

      # DEPRECATED
      def self.default_no_wrap=(value)
        @@default_bare = value
      end

      def prepare
        if !options.key?(:bare) and !options.key?(:no_wrap)
          options[:bare] = self.class.default_bare
        end
      end

      def evaluate(scope, locals, &block)
        @output ||= Wisp.compile(data, options)
      end

      def allows_script?
        false
      end
    end
  end
end
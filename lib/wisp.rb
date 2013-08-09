require 'execjs'
require 'wisp/source'
require 'wisp/runtime'
require 'wisp/rails' if defined? ::Rails
require 'wisp/padrino' if defined? ::Padrino

module Wisp
  extend Runtime

  class << self
    # compiles wisp to js. The source object can be a File,
    # StringIO, String or anything that responds to :read
    def compile source, options = {}
      source = source.read if source.respond_to?(:read)

      begin
        exec 'compile', source
      rescue Exception => e
        raise RuntimeError, e.to_s.delete("\n")
      end
    end

  protected
    # path to wisp library, defined in ruby-wisp-source gem
    def bundled_path
      File.dirname Wisp::Source.bundled_path
    end
  end

  # to require node packages that installed locally
  ENV['NODE_PATH'] = [
    File.expand_path('node_modules'),
    File.expand_path('vendor/node_modules'),
    bundled_path,
    ENV['NODE_PATH']
  ].join ':'
end

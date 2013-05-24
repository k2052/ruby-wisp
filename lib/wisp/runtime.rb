module Wisp
  module Runtime

    def exec *arguments
      check_availability!
      context.call *arguments
    end

  private
  
    def check_availability!
      unless runtime.available?
        message = "The Node.JS runtime isn't available to Stylus."
        message << "Ensure that the 'node' (or 'nodejs') executable is present in your $PATH."
        raise RuntimeError, message
      end
    end

    def context
      @context ||= runtime.compile script
    end

    def script
      File.read File.expand_path('../runtime/compiler.js',__FILE__)
    end

    def runtime
      @runtime ||= ExecJS::ExternalRuntime.new(
        :name => 'Node.js (V8)',
        :command => ["nodejs", "node"],
        :runner_path => File.expand_path("../runtime/runner.js", __FILE__)
      )
    end
  end
end
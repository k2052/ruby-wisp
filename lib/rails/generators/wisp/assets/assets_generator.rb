require "rails/generators/named_base"

module Wisp
  module Generators
    class AssetsGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path "../templates", __FILE__

      def copy_wisp
        template "javascript.js.wisp", File.join('app/assets/javascripts', class_path, "#{file_name}.js.wisp")
      end
    end
  end
end

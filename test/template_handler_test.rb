require 'test_helper'
require 'action_controller'
require 'wisp'

class SiteController < ActionController::Base
  self.view_paths = File.expand_path("../support", __FILE__)
end

App = ActionDispatch::Routing::RouteSet.new
App.draw do
  get "site/index"
end

class TemplateHandlerTest < ActiveSupport::TestCase
  include Rack::Test::Methods

  def app
    @app ||= App
  end

  test "coffee views are served as javascript" do
    get "/site/index.js"

    assert_match 'console.log("hello world")', last_response.body
  end
end

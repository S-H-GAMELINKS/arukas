require "test_helper"
require "dotenv"
require "json"

Dotenv.load

class ArukasTest < Minitest::Test

  def setup
    @arukas = Arukas::API::new(ENV["ARUKAS_JSON_API_TOKEN"], ENV["ARUKAS_JSON_API_SECRET"])
  end

  def test_that_it_has_a_version_number
    refute_nil ::Arukas::VERSION
  end

  def test_init_arukas
    refute_nil @arukas
  end

  def test_get_arukas_apps
    res = @arukas.get_apps
    assert res != nil
  end

  def test_post_arukas_apps
    json = File.read("test.json")
    res = @arukas.create_apps(json)
    assert res != nil
  end

  def test_get_arukas_app
    res = @arukas.get_apps
    id = JSON.parse(res)["data"][0]["id"]
    res = @arukas.get_app(id)
    assert res != nil  
  end

  def test_delete_arukas_app
    res = @arukas.get_apps
    images = JSON.parse(res)["data"]
    images.each{|image| assert @arukas.delete_app(image["id"]) != nil}
  end

  def test_get_arukas_services
    res = @arukas.get_services
    assert res != nil
  end
end

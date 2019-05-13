require "test_helper"
require "dotenv"

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
    assert @arukas.get_apps != nil
  end
end

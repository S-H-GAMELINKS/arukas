require "test_helper"
require "dotenv"
require "json"

Dotenv.load

class ArukasTest < Minitest::Test

  def setup
    @arukas = Arukas::API::new(ENV["ARUKAS_JSON_API_TOKEN"], ENV["ARUKAS_JSON_API_SECRET"])
    @json = File.read("test.json")
  end

  def create_arukas
    @arukas.create_apps(@json)
  end

  def delete_arukas
    res = @arukas.get_apps
    id = JSON.parse(res)["data"][0]["id"]
    @arukas.delete_app(id)
  end

  def test_that_it_has_a_version_number
    refute_nil ::Arukas::VERSION
  end

  def test_init_arukas
    refute_nil @arukas
  end

  def test_get_arukas_apps
    create_arukas
    res = @arukas.get_apps
    assert res != nil
    delete_arukas
  end

  def test_post_arukas_apps
    res = create_arukas
    assert res != nil
    delete_arukas
  end

  def test_get_arukas_app
    create_arukas
    res = @arukas.get_apps
    id = JSON.parse(res)["data"][0]["id"]
    res = @arukas.get_app(id)
    assert res != nil
    delete_arukas  
  end

  def test_delete_arukas_app
    create_arukas
    res = @arukas.get_apps
    images = JSON.parse(res)["data"]
    images.each{|image| assert @arukas.delete_app(image["id"]) != nil}
  end

  def test_get_arukas_services
    create_arukas
    res = @arukas.get_services
    assert res != nil
    delete_arukas
  end

  def test_get_arukas_service
    create_arukas
    res = @arukas.get_services
    id = JSON.parse(res)["data"][0]["id"]
    res = @arukas.get_service(id)
    assert res != nil
    delete_arukas  
  end

  def test_patch_arukas_service
    create_arukas
    res = @arukas.get_services
    id = JSON.parse(res)["data"][0]["id"]
    app_id = JSON.parse(res)["data"][0]["relationships"]["app"]["data"]["id"]
    json = File.read("patch.json")
    json.gsub!(/serviceid/, id)
    json.gsub!(/applicationid/, app_id)
    res = @arukas.patch_service(id, json)
    assert res != nil
    delete_arukas
  end
  def test_power_on_arukas_service
    create_arukas
    res = @arukas.get_services
    id = JSON.parse(res)["data"][0]["id"]
    res = @arukas.power_on_service(id)
    assert res != nil
    sleep 10
    res = @arukas.power_off_service(id)
    delete_arukas
  end

  def test_power_off_arukas_service
    create_arukas
    res = @arukas.get_services
    id = JSON.parse(res)["data"][0]["id"]
    res = @arukas.power_on_service(id)
    sleep 10
    res = @arukas.power_off_service(id)
    assert res != nil
    delete_arukas
  end
end

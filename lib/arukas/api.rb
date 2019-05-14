require "rest-client"
require "json"

module Arukas
    class API
        def initialize(token, secret)
            @url = "https://#{token}:#{secret}@app.arukas.io/api/"
        end

        def get_apps
            RestClient.get @url + "apps/"
        end

        def create_apps(params)
            RestClient.post @url + "apps/", payload=params, {:content_type => :json}
        end

        def get_app(id)
            RestClient.get @url + "apps/#{id}"
        end

        def delete_app(id)
            RestClient.delete @url + "apps/#{id}"
        end

        def get_services
            RestClient.get @url + "services/"
        end
    end
end

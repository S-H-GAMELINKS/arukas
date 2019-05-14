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

        def get_service(id)
            RestClient.get @url + "services/#{id}"
        end

        def patch_service(id, params)
            RestClient.post @url + "services/#{id}", payload=params, {:content_type => :json}
        end

        def power_on_service(id)
            RestClient.post @url + "services/#{id}/power"
        end

        def power_off_service(id)
            RestClient.delete @url + "services/#{id}/power"
        end
    end
end

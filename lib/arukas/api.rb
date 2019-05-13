require "rest-client"
require "json"

module Arukas
    class API
        def initialize(token, secret)
            @url = "https://#{token}:#{secret}@app.arukas.io/api/apps/"
        end

        def get_apps
            RestClient.get @url
        end

        def create_apps(params)
            RestClient.post @url, payload=params, {:content_type => :json}
        end

        def get_app(id)
            RestClient.get @url + "#{id}"
        end

        def delete_app(id)
            RestClient.delete @url + "#{id}"
        end
    end
end

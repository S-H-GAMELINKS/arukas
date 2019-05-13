require "rest-client"

module Arukas
    class API
        def initialize(token, secret)
            @url = "https://#{token}:#{secret}@app.arukas.io/api/apps/"
        end

        def get_apps
            RestClient.get @url
        end
    end
end

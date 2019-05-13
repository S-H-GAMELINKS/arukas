require "net/http"
require "uri"

module Arukas
    class API
        def initialize(token, secret)
            @uri = URI.parse("https://#{token}:#{secret}@app.arukas.io/api/apps/")
        end

        def get_apps
            Net::HTTP.get_response(@uri)
        end
    end
end

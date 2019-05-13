require "net/http"
require "uri"

module Arukas
    class API
        def initialize(token, secret)
            @arukas_token = token
            @arukas_secret = secret
        end

        def get_apps
            puts @arukas_token
            puts @arukas_secret
            uri = URI.parse("https://#{@arukas_token}:#{@arukas_secret}@app.arukas.io/api/apps/")
            response = Net::HTTP.get_response(uri)
        end
    end
end

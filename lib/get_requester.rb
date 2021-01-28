require 'net/http'
require 'open-uri'
require 'json'
require 'pry'

class GetRequester
    #attr_accessor :url

    def initialize(url)
        @url = url
    end

    def get_response_body
        uri = URI.parse(@url)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json
        arr = []
        programs = JSON.parse(self.get_response_body)
        programs.collect do |i|   #{"name"=>"Daniel", "occupation"=>"LG Fridge Salesman"}
            #i["CONVERTED_DATA"]
             arr << i
        end
        arr
    end
end
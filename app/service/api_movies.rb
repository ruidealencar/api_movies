require 'uri'
require 'net/http'

class ApiMovies
  def self.get_movies_by_name(name)
    url = URI("http://www.omdbapi.com/?t=#{name}&apikey=418e0a47")

    http = Net::HTTP.new(url.host, url.port);
    request = Net::HTTP::Get.new(url)
    request["Cookie"] = "__cfduid=d3670b25bb89f55a116515e3cc2e45fc41602113912"

    response = http.request(request)
    JSON.parse(response.read_body)
  end

  def self.get_movies_by_id(id)
    url = URI("http://www.omdbapi.com/?i=#{id}&apikey=418e0a47")

    http = Net::HTTP.new(url.host, url.port);
    request = Net::HTTP::Get.new(url)
    request["Cookie"] = "__cfduid=d3670b25bb89f55a116515e3cc2e45fc41602113912"

    response = http.request(request)
    JSON.parse(response.read_body)
  end
end

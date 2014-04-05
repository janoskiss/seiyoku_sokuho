require "open-uri"
require "uri"
require "nokogiri"

require "pp"

class Tasks::CrawlTask
  BASE_URI    = "http://www.xvideos.com/"
  SEARCH_PATH = "tags/japanese/s:rating/m:allduration/"

  def self.execute
    endpoint = URI.join(BASE_URI, SEARCH_PATH)
    context  = Nokogiri.HTML(open(endpoint))

    context.css("#content .mozaique .thumbBlock .thumbInside").each do |video|
      url       = URI.join(BASE_URI, video.css(".thumb a").attribute("href")).to_s
      thumbnail = video.css(".thumb a").children.attribute("src").text
      title     = video.css("p a").children.text

      Video.create(url: url, thumbnail: thumbnail, title: title)
    end
  end
end

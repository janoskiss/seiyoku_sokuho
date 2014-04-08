require "open-uri"
require "uri"
require "nokogiri"

class Tasks::CrawlTask
  BASE_URL   = "http://www.xvideos.com/"
  CRAWL_PATH = "tags/japanese/s:rating/m:allduration/d:day"

  def self.execute
    endpoint = URI.join(BASE_URL, CRAWL_PATH)
    context  = Nokogiri.HTML(open(endpoint))

    context.css("#content .mozaique .thumbBlock .thumbInside").each do |video|
      path      = video.css(".thumb a").attribute("href")

      url       = URI.join(BASE_URL, path).to_s
      thumbnail = video.css(".thumb a").children.attribute("src").text
      title     = video.css("p a").children.text

      Video.create(url: url, thumbnail: thumbnail, title: title)
    end
  end
end

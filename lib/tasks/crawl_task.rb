require "open-uri"
require "uri"
require "nokogiri"

class Tasks::CrawlTask
  CRAWL_PATH = "tags/japanese/s:rating/m:allduration/d:day"

  def self.execute
    endpoint = URI.join(Video::BASE_URL, CRAWL_PATH)
    context  = Nokogiri.HTML(open(endpoint))

    context.css("#content .mozaique .thumbBlock .thumbInside").each do |video|
      code      = video.css(".thumb a").attribute("href").text.slice(/(?<=\/video)\d+/)
      thumbnail = video.css(".thumb a").children.attribute("src").text
      title     = video.css("p a").children.text

      Video.create(code: code, thumbnail: thumbnail, title: title)
    end
  end
end

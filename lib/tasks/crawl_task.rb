require "open-uri"
require "uri"
require "nokogiri"

class Tasks::CrawlTask
  CRAWL_PATH = "tags/japanese/s:rating/m:allduration/d:day"

  def self.execute
    endpoint = URI.join(Video::BASE_URL, CRAWL_PATH)
    context  = Nokogiri.HTML(open(endpoint))

    context.css("#content .mozaique .thumbBlock .thumbInside").each do |video|
      path = video.css(".thumb a").attribute("href").text

      Video.create(
        code:      path.slice(/(?<=\/video)\d+/),
        thumbnail: video.css(".thumb a").children.attribute("src").text,
        title:     video.css("p a").children.text,
        next_deletion_detection_at: Video.next_deletion_detection_at(Time.now)
      )
    end
  end
end

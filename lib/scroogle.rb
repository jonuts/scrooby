require "cgi"
require "open-uri"

module Scroogle
  class Scraper
    BASE_URI = 'http://www.scroogle.org/cgi-bin/nbbw.cgi?Gw=%s&n=%s'
    RESULT = /\d+\. <A Href=(.+)>(.+)<\/a>\n<ul>(.+)<\/ul>/
    
    class << self      
      attr_reader :response, :results
      
      def search(kw, results=100)
        @response = open(BASE_URI % [CGI.escape(kw), results]).read.gsub(/<b>/,'').gsub(/<\/b>/,'')
        self.parse
      end
  
      def parse
        @results = @response.scan(RESULT).map {|res| Result.new(res)}
      end
    end
  end

  class Result
    attr_reader :url, :title, :blurb
    
    def initialize(item)
      @url, @title, @blurb = item[0].dehtmlize, item[1].dehtmlize, item[2].dehtmlize
    end
  end
  
end

class String
  def dehtmlize
    self.gsub(/<.+?>/,'').gsub('"','')
  end
end

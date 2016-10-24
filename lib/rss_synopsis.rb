require 'rss_synopsis/version'
require 'summarize'
require 'action_view'
require 'htmlentities'
require 'simple-rss'
require 'open-uri'

module RssSynopsis
 def RssSynopsis.extractText(html_string)
    ActionView::Base.full_sanitizer.sanitize(html_string, :tags => %w(a img link), :attributes => %w(src style href))
  end

  def RssSynopsis.truncate(txt, len)
    txt.length > len ? "#{txt[0...len]}..." : txt
  end

  def RssSynopsis.proccessRSS(url, len= 300)
    rss = SimpleRSS.parse open(url)
    @items = rss.items.collect do |item| 
      text = RssSynopsis.extractText(HTMLEntities.new.decode item.description.force_encoding("UTF-8")).squeeze
      synopsis, topics = text.summarize(:topics => true)
      { text: text, synopsis: synopsis, truncated: RssSynopsis.truncate( synopsis, len), topics: topics}
    end
    @items
  end    
end

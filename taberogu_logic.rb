require_relative './taberogu_crawler.rb'
require_relative './taberogu_parser.rb'
require_relative './common.rb'

class TaberoguLogic
  def initialize
    @crawler = TaberoguCrawler.new
    @parser = TaberoguParser.new
  end

  def main
    @crawler.navigate_web_page
    loop do
      shop_arr = @parser.parse_shop_list(@crawler.html)
      shop_arr.each do |shop|
        shop_hash = @parser.get_shop_info(shop)
        detail_html = @crawler.navigate_detail_page(shop_hash["url"])
        detail_hash = @parser.parse_detail_page(detail_html)
        shop_hash.merge!(detail_hash)
        insert_hash(TaberoguInfo, shop_hash)
        @crawler.back_page
      end
      @crawler.next_page
    end
  end

  def insert_hash(class_name,hash)
    class_name.create(hash)
  end
end

logic = TaberoguLogic.new
logic.main
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
        next if record_existing?(TaberoguInfo, shop_hash)
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

  def record_existing?(class_name,shop_hash)
    hash = {
      name: shop_hash["name"],
      url: shop_hash["url"]
    }
    same_record = class_name.find_by(hash)
  end
end

logic = TaberoguLogic.new
logic.main
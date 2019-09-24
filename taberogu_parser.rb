require_relative "selenium.rb"
require_relative "common.rb"

class TaberoguParser
  def parse_shop_list(html)
    doc = Nokogiri::HTML.parse(html, nil, "UTF-8")
    shop_arr = doc.css("div.list-rst__wrap.js-open-new-window")
    return shop_arr
  end

  def get_shop_info(shop)
    shop_hash = {
      "name" => shop.css("a.list-rst__rst-name-target.cpy-rst-name").text,
      "point" => shop.css("span.list-rst__rating-val").text,
      "budget" => shop.css("span.cpy-dinner-budget-val").text,
      "url" => shop.css("a.list-rst__rst-name-target.cpy-rst-name").attribute("href").text
    }
    return shop_hash
  end

  def parse_detail_page(html)
    doc = Nokogiri::HTML.parse(html, nil, "UTF-8")
    detail_hash = {
      "tel" => doc.css("strong.rstinfo-table__tel-num")[0]&.text,
      "address"=> doc.css("p.rstinfo-table__address")&.text
    }
    return detail_hash
  end
end
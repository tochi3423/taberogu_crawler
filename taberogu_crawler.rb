require_relative 'selenium.rb'
require_relative 'common.rb'

class TaberoguCrawler < SeleniumHelper

  def navigate_web_page
    @session.navigate.to "https://tabelog.com/tokyo/rstLst/sushi/?sk=%E5%92%8C%E9%A3%9F&svd=20190924&svt=1900&svps=2"
    sleep_designated
  end

  def next_page
    return unless css_exist?("a.c-pagination__arrow")
    query_click("a.c-pagination__arrow")
    sleep_designated
  end

  def navigate_detail_page(url)
    @session.navigate.to(url)
    sleep_designated
    return html
  end

  def back_page
    @session.navigate.back
    sleep_designated
  end
end
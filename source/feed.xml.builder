general_site_url = "http://webbox5.webbox.io/"
general_author = "webBox.io"
general_author_email = "hello@webbox.io"
general_subtitle = "Her cuma 5 dakika!"
general_summary = "webBox.io ekibi olarak sizlere 5 dakikalık bir podcast hazırladık!"
general_description = "5 dakikada haftanın özeti. Development dünyasında neler oldu? Yeni çıkan kütüphaneler, dedikodular, kitaplar ve açık kaynak dünyası!"
general_keywords = "webbox5,development,yazılım,yazilim,software,python,ruby,php,django,rails,apple,mac,ipad,iphone,ios,applescript,shell,bash,textmate,vim,atom"

xml.instruct!
xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd", :version => "2.0" do
  xml.channel do
    xml.atom :link, "xmlns:atom" => "http://www.w3.org/2005/Atom", :rel => "self", :type => "application/rss+xml", :href => "http://devpod.org/feed.xml"
        xml.title "devPod"
        xml.link general_site_url
        xml.language "tr-tr"
        xml.copyright general_author
        xml.itunes :subtitle, general_subtitle
        xml.itunes :author, general_author
        xml.itunes :summary, general_summary
        xml.itunes :description, general_description
        xml.itunes :owner do
          xml.itunes :name, general_author
          xml.itunes :email, general_author_email
        end
        xml.itunes :image, :href => "#{general_site_url}public/images/webbox5-logo-1400x1400.png"
        xml.itunes :category, :text => "Technology" do
          xml.itunes :category, :text => "Podcasting"
        end
        xml.itunes :category, :text => "Technology" do
          xml.itunes :category, :text => "Software How-To"
        end
        xml.itunes :category, :text => "Technology" do
          xml.itunes :category, :text => "Tech News"
        end
        xml.itunes :explicit, "no"
        xml.itunes :keywords, general_keywords

        blog.articles.each do |article|
          clean_description = Sanitize.clean(article.summary).strip
          xml.item do
            xml.title article.title
            xml.pubDate article.date.to_time.rfc2822
            xml.description clean_description
            xml.itunes :summary, clean_description
            xml.itunes :subtitle, clean_description
            xml.enclosure :url => article.metadata[:page]['download'], :length => article.metadata[:page]['length'], :type => article.metadata[:page]['type']
            xml.guid URI.join(general_site_url, article.url), :isPermaLink => "false"
            xml.itunes :duration, article.metadata[:page]['duration']
            xml.itunes :keywords, article.tags.join(",")
          end
        end
  end
end

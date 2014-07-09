module CustomHelpers
  def icon_circle(input)
    "<span class=\"fa-stack\"><i class=\"fa fa-circle fa-stack-2x\"></i><i class=\"fa fa-#{input} fa-stack-1x fa-inverse\"></i></span>"
  end

  def icon(input, more_classes = [])
    extra_classes = more_classes.map{|i| "fa-#{i}"}.join(" ")
    "<i class=\"fa fa-#{input} #{extra_classes}\"></i>"
  end
  
  def share(options={})
    options[:classes] ||= []
    options[:via] ||= "webboxio"
    options[:hash_tags] ||= "webboxtraining"

    case options[:network]
    when "twitter"
      "<a href=\"https://twitter.com/share\" class=\"twitter-share-button #{options[:classes].join('')}\" data-lang=\"tr\" data-url=\"#{options[:url]}\" data-text=\"#{options[:status]}\" data-via=\"#{options[:via]}\" data-hashtags=\"#{options[:hash_tags]}\"></a>"
    when "facebook"
      "<div class=\"fb-like\" data-href=\"#{options[:url]}\" data-layout=\"button_count\" data-action=\"like\" data-show-faces=\"false\" data-share=\"true\"></div>"
    end
  end
  

  def custom_pager(**options)
    output = []
    if options[:paginate] && options[:num_pages] > 1
      output << '<ul class="pagination">'

      if options[:prev_page]
        li_class = "previous"
        a_link = link_to "&larr;", options[:prev_page], :target => "_self"
      else
        li_class = "previous disabled"
        a_link = link_to "&larr;", ""
      end
      output << "<li class=\"#{li_class}\">#{a_link}</li>"

      (1..options[:num_pages]).each do |n|
        li_class = ""
        li_class = "active" if n == options[:current_page]
        a_link = options[:url_home]
        a_link = options[:url_schema] % n if n > 1

        output << "<li class=\"#{li_class}\">#{link_to n, a_link, :target => '_self'}</li>"
      end

      if options[:next_page]
        li_class = "next"
        a_link = link_to "&rarr;", options[:next_page], :target => "_self"
      else
        li_class = "next disabled"
        a_link = link_to "&rarr;", ""
      end
      output << "<li class=\"#{li_class}\">#{a_link}</li>"

      output << '</ul>'
    end
    output.join("\n")
  end
  
  
end

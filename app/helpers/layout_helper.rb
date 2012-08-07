module LayoutHelper
  def title(page_title, show_title = true)
    content_for(:title) { page_title.to_s }
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

  def gauges(code)
    %Q{<script type="text/javascript">var _gauges=_gauges||[];(function(){var t=document.createElement('script');t.async=true;t.id='gauges-tracker';t.setAttribute('data-site-id','#{code}');t.src='//secure.gaug.es/track.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(t, s);})();</script>}.html_safe if Rails.env.production?
  end
  
  # This is terrible
  def image_url(source)
    abs_path = image_path(source)
    unless abs_path =~ /\Ahttp/
      # TODO: Use the asset host
      abs_path = "http://#{request.host_with_port}#{abs_path}"
    end
    abs_path
  end
end

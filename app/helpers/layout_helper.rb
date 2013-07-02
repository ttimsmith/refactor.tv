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

  def follow_button(username, options = {})
    options_string = options.map { |key, value| "data-#{key}=\"#{value}\"" }.join(' ')
    options_string = " #{options_string}" if options_string.length > 0

    %Q{<a href="https://twitter.com/#{username}" class="twitter-follow-button" data-show-count="false"#{options_string}>Follow @#{username}</a>
    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>}.html_safe
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

  def video_player(episode, options = {})
    return '' unless episode.vimeo_id

    width = (options[:width] || 640)
    height = (options[:height] || 360)

    %Q{<iframe src="http://player.vimeo.com/video/#{episode.vimeo_id}?title=0&amp;byline=0&amp;portrait=0" width="#{width}" height="#{height}" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>}.html_safe
  end
end

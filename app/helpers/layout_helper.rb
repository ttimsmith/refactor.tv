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
    width = (options[:width] || 640)
    height = (options[:height] || 360)

    # Calculate poster size
    poster_sizes = [360, 480, 720]
    poster_size = poster_sizes.last
    poster_sizes.each do |size|
      if height <= size
        poster_size = size
        break
      end
    end

    %Q{<video class="sublime" poster="http://assets.refactor.tv/episodes/#{episode.padded_position}/Episode#{episode.padded_position}-#{poster_size}-poster.jpg" width="#{width}" height="#{height}" data-name="Refactor.tv Episode ##{episode.position}" data-uid="refactortv-#{episode.position}" preload="none">
      <source src="http://download.refactor.tv/episodes/#{episode.padded_position}/Episode#{episode.padded_position}-480.mp4" />
      <source src="http://download.refactor.tv/episodes/#{episode.padded_position}/Episode#{episode.padded_position}-720.mp4" data-quality="hd" />
      <source src="http://download.refactor.tv/episodes/#{episode.padded_position}/Episode#{episode.padded_position}-480.webm" />
      <source src="http://download.refactor.tv/episodes/#{episode.padded_position}/Episode#{episode.padded_position}-720.webm" data-quality="hd" />
    </video>}.html_safe
  end
end

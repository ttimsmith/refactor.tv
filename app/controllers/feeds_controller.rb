class FeedsController < ApplicationController
  def show
    @feed_type = params[:file_type]
    @episode_files = EpisodeFile.published_with_type(@feed_type)
    if @episode_files.blank?
      head :not_found and return
    end

    @feed_name = @episode_files.first.display_name
    render template: 'feeds/podcast', format: 'xml'
  end
end

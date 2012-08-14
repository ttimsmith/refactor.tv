class FeedsController < ApplicationController
  def show
    @feed_type = params[:file_type]
    @episode_files = EpisodeFile.where(file_type: @feed_type)
    if @episode_files.blank?
      head :not_found and return
    end

    render template: 'feeds/podcast', format: 'xml'
  end
end

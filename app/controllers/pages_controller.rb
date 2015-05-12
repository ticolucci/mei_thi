class PagesController < ApplicationController
  def index
    Rails.logger.info "host: #{request.host}"
    Rails.logger.info "params: #{request.params.inspect}"
    @message = Message.new
  end
end

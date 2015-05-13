class MessagesController < ApplicationController
  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      render @message, :layout => false, :status => :created
    else
      render text: "<div class='error'> #{@message.errors.inspect} </div>", :layout => false, :status => :unprocessable_entity
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:message, :from, :email)
    end
end

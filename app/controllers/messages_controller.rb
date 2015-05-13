class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to root_path + '#leave-a-message'
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

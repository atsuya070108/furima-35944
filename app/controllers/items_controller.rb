class ItemsController < ApplicationController
  private

  def item_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end

class MainController < ApplicationController
  def index
    @user = current_user
    if @user!= nil && !@user.admin
      redirect_to '/users/' + current_user.id.to_s
    else
      render 'index'
    end
  end
end

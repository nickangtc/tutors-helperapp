class MainController < ApplicationController
  def index
    @user = current_user
    if !@user.admin
      redirect_to '/users/' + current_user.id.to_s
    end
  end
end

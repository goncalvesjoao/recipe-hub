class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ show ]
  before_action :set_user, only: %i[ show ]

  # GET /users/1
  def show
        puts "Current user: #{Current.user.inspect}"
  end

  private

  def set_user
    if params[:id] == "me" && authenticated?
      @user = Current.user
    else
      @user = User.find(params.expect(:id))
    end
  end
end

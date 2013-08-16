class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @projects  = current_user.projects
    end
  end
end
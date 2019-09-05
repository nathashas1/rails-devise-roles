class VisitorsController < ApplicationController

  before_action :find_visitor

  # Increment page view of the current user/last logged in user
  def index
    if @visitor
      @page = PageView.where(user_id: @visitor.id).first_or_create
      @page.increment!(:page_viewed)
    end
  end

  # Find the current visitor of the page.
  # If logged in, take the current user or check cookies for the last signed in user
  def find_visitor
    if current_user
      @visitor = current_user
      cookies[:user_id] = { :value => current_user.id, :expires => 2.weeks.from_now }
    else
      @visitor = cookies[:user_id] ? User.find(cookies[:user_id]) : nil
    end
  end
end

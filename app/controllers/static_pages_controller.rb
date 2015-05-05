class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @entry  = current_user.entries.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def news
    @feed_items = User.find(1).feed.paginate(page: params[:page])
  end

  def thunderbird
  end

  def help
  end

  def about
  end
end

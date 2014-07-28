class NewspostsController < ApplicationController

  before_action :signed_in_user, only: [:create, :destroy]

  def create
    @newspost = current_user.newsposts.build(newspost_params)
    if @newspost.save
      flash[:success] = "Newspost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

   def newspost_params
    params.require(:newspost).permit(:content)  
   end

end

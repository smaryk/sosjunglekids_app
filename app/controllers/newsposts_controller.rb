class NewspostsController < ApplicationController

  before_action :signed_in_user, only: [ :new, :create, :destroy]

  def new
    @newspost = Newspost.new
    @newspost_attachment = @newspost.newspost_attachments.build
  end

  def create
    @newspost = current_user.newsposts.build(newspost_params)
    @newspost_attachment = @newspost.newspost_attachments.build
 
    if @newspost.save

       params[:newspost_attachments]['file'].each do |a|
          @newspost_attachment = @newspost.newspost_attachments.create!(:file=> a, :newspost_id => @newspost.id)
       end

      flash[:success] = "Newspost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @newspost.destroy
  end

  def show
    @newspost_attachments = @newspost.newspost_attachments.all
  end

  private

   def newspost_params
    params.require(:newspost).permit(:content, newspost_attachments_attributes: [:id, :newspost_id, :file])  
   end

end
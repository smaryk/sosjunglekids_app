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
       
       if(:newspost_attachments['file'])
         params[:newspost_attachments]['file'].each do |a|
           @newspost_attachment = @newspost.newspost_attachments.create!(:file=> a, :newspost_id => @newspost.id)
         end
       end
      flash[:success] = "Newspost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy

    Newspost.find(params[:id]).destroy
    flash[:success] = "Newspost deleted."
    redirect_to users_url  
  end

  def show
    @newspost = Newspost.find(params[:id])
    @newspost_attachments = @newspost.newspost_attachments.all
  end

  private

   def newspost_params
    params.require(:newspost).permit(:title, :content, newspost_attachments_attributes: [:id, :newspost_id, :file])  
   end

end

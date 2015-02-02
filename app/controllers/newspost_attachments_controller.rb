class NewspostAttachmentsController < ApplicationController
  before_action :set_newspost_attachment, only: [:show, :edit, :update, :destroy]

  # GET /newspost_attachments
  # GET /newspost_attachments.json
  def index
    @newspost_attachments = NewspostAttachment.all
  end

  # GET /newspost_attachments/1
  # GET /newspost_attachments/1.json
  def show
  end

  # GET /newspost_attachments/new
  def new
    @newspost_attachment = NewspostAttachment.new
  end

  # GET /newspost_attachments/1/edit
  def edit
  end

  # POST /newspost_attachments
  # POST /newspost_attachments.json
  def create
    @newspost_attachment = NewspostAttachment.new(newspost_attachment_params)

    respond_to do |format|
      if @newspost_attachment.save
        format.html { redirect_to @newspost_attachment, notice: 'Newspost attachment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @newspost_attachment }
      else
        format.html { render action: 'new' }
        format.json { render json: @newspost_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newspost_attachments/1
  # PATCH/PUT /newspost_attachments/1.json
  def update
    respond_to do |format|
      if @newspost_attachment.update(newspost_attachment_params)
        format.html { redirect_to @newspost_attachment, notice: 'Newspost attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @newspost_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newspost_attachments/1
  # DELETE /newspost_attachments/1.json
  def destroy
    @newspost_attachment.destroy
    respond_to do |format|
      format.html { redirect_to newspost_attachments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newspost_attachment
      @newspost_attachment = NewspostAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newspost_attachment_params
      params.require(:newspost_attachment).permit(:newspost_id, :file)
    end
end

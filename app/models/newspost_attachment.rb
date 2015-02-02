class NewspostAttachment < ActiveRecord::Base

   mount_uploader :file, FileUploader
   belongs_to :newspost

end

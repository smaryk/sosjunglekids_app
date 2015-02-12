class Newspost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  has_many :newspost_attachments
  accepts_nested_attributes_for :newspost_attachments

  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 2000 }
  validates :user_id, presence: true
end

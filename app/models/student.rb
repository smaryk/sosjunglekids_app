class Student < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true

  validates :first_name, presence: true, length: { maximum:50 }
  validates :last_name,  presence: true, length: { maximum:50 }
end

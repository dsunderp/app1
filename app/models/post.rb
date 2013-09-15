class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :title, presence: true, length:{maximum: 200}
  validates :user_id, presence: true
  has_many :users, through: :bids

end

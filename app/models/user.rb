class User < ActiveRecord::Base
  before_save { self.username = username.downcase }
  before_create :create_remember_token
  validates :username, presence: true, uniqueness: {case_sensitive: false}

  has_many :posts, dependent: :destroy

  has_many :bids, dependent: :destroy

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  def bid?(post)
    bids.find_by(post_id:post.id)
  end
  def bid!(post)
    bids.create!(post_id: post.id)
  end
  def unbid!(post)
    bids.find_by(post_id: post.id).destroy!
  end
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end


  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

end

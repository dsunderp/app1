class Post < ActiveRecord::Base
  belongs_to :user
  validate :title, length:{maximum: 200}

end

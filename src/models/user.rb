class User < ActiveRecord::Base

  validates :username,   presence: true , length: { minimum: 6  }
  validates :password,   presence: true

  def user_name
    username
  end

  def user_name=( val )
    username = val
  end

end

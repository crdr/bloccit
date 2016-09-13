class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< HEAD
 
=======
         
>>>>>>> 11787569d75c7220e621c16474ff1ddc3c5da5ae
  has_many :posts
  
  def admin?
    role == 'admin'
  end
  
  def moderator?
    role == 'moderator'
  end
end

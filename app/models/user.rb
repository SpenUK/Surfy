class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  has_one :profile
  has_many :surf_sessions
  has_many :waves, through: :surf_sessions


	def full_name
  	return "#{first_name} #{last_name}"
  end

  def gravitar_url
      gravitar = Digest::MD5.hexdigest(email)
      "http://www.gravatar.com/avatar/#{gravitar}.jpg"
  end     

  private
  def user_params
  	unless params[:user].blank?
  		  params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :profile_name)
  	end
  end

end

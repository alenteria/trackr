class User < ActiveRecord::Base
  has_many :posts
  has_many :assignments
  has_many :posts, :through => :assignments
  
  
  before_create :cap_name
  
  def cap_name
    self.fname = self.fname.capitalize
    self.lname = self.lname.capitalize
  end
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #has_attached_file :pic, :default_url => "/:class/:attachment/missing_:style.png"
  has_attached_file :pic, :styles => 
           { :medium => "100x100>", :thumb => "50x50>" }
   #has_attached_file :attach
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :id, :fname, :lname, :email, :password, :password_confirmation, :remember_me, :pic
  # attr_accessible :title, :body
  
  
 def full_name
    "#{fname} #{lname}"
 end
  
end

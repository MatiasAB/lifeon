class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_writer :login
  
  has_many :tasks, dependent: :destroy
  
  before_save { |user| user.email = email.downcase }
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  
  validates :encrypted_password, presence: true
  
  validates :password, presence: true
  
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  
  validates :username,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  def validate_username
	  if User.where(email: username).exists?
		errors.add(:username, :invalid)
	  end
  end
  
  def to_param
    username
  end

  def login
    @login || self.username || self.email
  end
  
  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_hash).first
      end
    end
end

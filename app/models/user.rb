class User < ActiveRecord::Base
  has_many :authorships
  has_many :articles, :through => :authorships

  has_friendly_id :name, :use_slug => true
  attr_accessible :name, :email, :password, :password_confirmation
  before_create :downcase_fields

  attr_accessor :password
  before_save :prepare_password#, :downcase_fields

  validates_presence_of :name, :email
  validates_presence_of :password, :on => :create
#  validates_format_of :name, :with => /^[-\w\ ]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or -"
  validates_length_of :password, :minimum => 4, :allow_blank => true
  validates_confirmation_of :password
  validates_uniqueness_of :name, :email, :case_sensitive => false

  # login can be either name or email address
  def self.authenticate(login, pass)
    user = find_by_name(login) || find_by_email(login)
    return user if user && user.password_hash == user.encrypt_password(pass)
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end

  private

  def downcase_fields
    self.email.downcase!
  end

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end
end


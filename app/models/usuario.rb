class Usuario
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  CONFIRMATION_TOKEN_EXPIRATION = 60.minutes
  field :email, type: String
  field :password_digest, type: String
  field :name, type: String

  has_one :carrito, autosave: true
  has_one :venta,  autosave: true
  #validates :username, email: true, uniqueness: true
  #validates :email, email: true, uniqueness: true
  validates :venta, presence: true
  
  
  has_secure_password
  include BCrypt
  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def generate_confirmation_token
    signed_id expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: :confirm_email
  end
end

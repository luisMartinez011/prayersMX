class Usuario 
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  CONFIRMATION_TOKEN_EXPIRATION = 10.minutes

  has_one :carrito, autosave: true
  field :email, type: String
  field :password_digest, type: String
  has_secure_password

  validates_presence_of :carrito
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

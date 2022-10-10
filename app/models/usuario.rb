class Usuario
  include Mongoid::Document
  include Mongoid::Timestamps
  has_secure_password 
  validates :password, presence: true
  field :email, type: String
  #has_one :carrito
  CONFIRMATION_TOKEN_EXPIRATION = 10.minutes

  

  before_save :downcase_email

  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true

  

  def generate_confirmation_token
    signed_id expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: :confirm_email
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end

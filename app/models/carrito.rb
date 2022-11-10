class Carrito
  include Mongoid::Document
  include Mongoid::Timestamps
  has_and_belongs_to_many :orders, inverse_of: nil
  belongs_to :usuario, autosave: true
  field :total, type: Float

  #validates :total, presence: true

  
end

class Carrito
  include Mongoid::Document
  include Mongoid::Timestamps
  has_and_belongs_to_many :productos, inverse_of: nil
  belongs_to :usuario, optional: true
  field :total, type: Float
  field :cantidadComprada, type: Float

  #validates :cantidadComprada, presence: true

  
end

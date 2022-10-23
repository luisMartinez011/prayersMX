class Carrito
  include Mongoid::Document
  include Mongoid::Timestamps
  has_and_belongs_to_many :productos, inverse_of: nil
  field :total, type: Float
  field :cantidadComprada, type: Integer
end

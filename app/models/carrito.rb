class Carrito
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :usuario
  has_many :productos
end

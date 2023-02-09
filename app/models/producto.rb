class Producto
  
  include Mongoid::Document
  include Mongoid::Timestamps
  delegate :can?, :cannot?, to: :ability
  field :nombre, type: String
  field :precio, type: Float
  field :descripcion, type: String
  field :imagen, type: String

  validates :nombre, uniqueness: true, presence: true
  validates :precio, presence: true
  validates :descripcion, presence: true
  validates :imagen, presence: true

  
end

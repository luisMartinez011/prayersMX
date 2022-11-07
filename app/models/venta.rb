class Venta
  include Mongoid::Document
  include Mongoid::Timestamps
  has_and_belongs_to_many :productos, inverse_of: nil
  #validates_presence_of :producto
  field :comprado, type: Integer
  field :total, type: Float
end


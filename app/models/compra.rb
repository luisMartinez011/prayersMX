class Compra
  include Mongoid::Document
  include Mongoid::Timestamps
  has_and_belongs_to_many :productos, inverse_of: nil
  belongs_to :usuario, optional: true

  field :comprado, type: Integer
  field :total, type: Float
end

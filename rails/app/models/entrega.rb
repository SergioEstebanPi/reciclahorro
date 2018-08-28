class Entrega < ApplicationRecord
  belongs_to :vecino
  belongs_to :recolector
end

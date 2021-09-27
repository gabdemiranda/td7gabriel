class PropertyType < ApplicationRecord
  has_many :property
  validates :name, presence: { message: 'Cadastro inválido, preencha os campos corretamente' }
  validates :name, uniqueness: { message: 'Tipo de imóvel já existente no banco de dados' }
end

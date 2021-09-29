class PropertyLocation < ApplicationRecord
  has_many :properties
  validates :name, presence: { message: 'Cadastro inválido, preencha os campos corretamente' }
  validates :name, uniqueness: { message: 'Região já existente no banco de dados' }
end

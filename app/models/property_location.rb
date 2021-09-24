class PropertyLocation < ApplicationRecord
  validates :name, presence: { message: 'Cadastro inválido, preencha os campos corretamente' }
  validates :name, uniqueness: { message: 'Região já existente no banco de dados' }
end

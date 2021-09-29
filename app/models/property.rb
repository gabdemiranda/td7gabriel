class Property < ApplicationRecord
  belongs_to :property_location
  belongs_to :property_type
  validates :title,  presence: { message: 'Título não pode ficar em branco' }
  validates :description,  presence: { message: 'Descrição não pode ficar em branco' }
  validates :rooms,  presence: { message: 'Quartos não pode ficar em branco' }
  validates :bathrooms,  presence: { message: 'Banheiros não pode ficar em branco' }
  validates :daily_rate,  presence: { message: 'Diária não pode ficar em branco' }
end

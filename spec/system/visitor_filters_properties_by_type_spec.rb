require 'rails_helper'

describe 'Visitor filters properties by type' do
  it 'should view links on nav bar' do
    PropertyType.create!(name: 'Apartamento')
    PropertyType.create!(name: 'Casa')
    PropertyType.create!(name: 'Sítio')

    visit root_path

    expect(page).to have_link('Apartamento')
    expect(page).to have_link('Casa') 
    expect(page).to have_link('Sítio')
  end

  it 'sucessfully' do
    casa = PropertyType.create!(name: 'Casa')
    apartamento = PropertyType.create!(name: 'Apartamento')
    rio = PropertyLocation.create!(name: 'Rio de Janeiro')
    manaus = PropertyLocation.create!(name: 'Manaus')
    property = Property.create!({ title: 'Casa com quintal em Copacabana', 
                                 description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                                 rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500, property_type: casa, property_location: rio
                               })
    Property.create!({ title: 'Cobertura em Manaus', 
                      description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                      rooms: 5, parking_slot: false, bathrooms: 5, pets: true, daily_rate: 1000, property_type: apartamento, property_location: manaus
                    })

    visit root_path
    click_on 'Casa'

    expect(page).to have_link('Casa com quintal em Copacabana')
    expect(page).not_to have_content('Cobertura em Manaus')
  end  
end
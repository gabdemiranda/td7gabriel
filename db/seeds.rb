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
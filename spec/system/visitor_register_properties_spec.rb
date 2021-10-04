require 'rails_helper'

describe 'Visitor register property' do
  it 'successfully' do
    property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')
    PropertyType.create!(name: 'Casa')
    PropertyLocation.create!(name: 'Florianópolis')

    login_as property_owner, scope: :property_owner
    visit root_path
    click_on 'Cadastrar Imóvel'

    fill_in 'Título', with: 'Casa em Florianópolis'
    fill_in 'Descrição', with: 'Ótima casa perto da UFSC'
    fill_in 'Quartos', with: '3'
    fill_in 'Banheiros', with: '2'
    fill_in 'Diária', with: 200
    select 'Casa', from: 'Tipo'
    select 'Florianópolis', from: 'Região'
    check 'Aceita Pets'
    check 'Estacionamento'
    click_on 'Enviar'

    expect(page).to have_content('Casa em Florianópolis')
    expect(page).to have_content('Ótima casa perto da UFSC')
    expect(page).to have_content("Quartos: 3")
    expect(page).to have_content("Banheiros: 2")
    expect(page).to have_content("Aceita Pets: Sim")
    expect(page).to have_content("Estacionamento: Sim")
    expect(page).to have_content("Diária: R$ 200,00")
    expect(page).to have_content("Tipo: Casa")
  end
end

describe 'Visitor tries to register empty property fields' do
  it 'and must fill all fields' do
    property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')

    login_as property_owner, scope: :property_owner
    visit root_path
    click_on 'Cadastrar Imóvel'
    click_on 'Enviar'

    expect(page).to have_content('Título não pode ficar em branco')
    expect(page).to have_content('Descrição não pode ficar em branco')
    expect(page).to have_content('Quartos não pode ficar em branco')
    expect(page).to have_content('Banheiros não pode ficar em branco')
    expect(page).to have_content('Diária não pode ficar em branco')
    expect(Property.count).to eq(0)
  end
end

describe 'Visitor register property type' do
  it 'successfully' do
    visit root_path
    click_on 'Cadastrar tipo de Imóvel'
    fill_in 'Tipo de Imóvel', with: 'Apartamento'
    click_on 'Enviar'

    expect(page).to have_content('Imóveis do tipo Apartamento')
  end
end

describe 'Visitor tries to register empty property type' do
  it 'unsuccessfully' do
    visit root_path
    click_on 'Cadastrar tipo de Imóvel'
    fill_in 'Tipo de Imóvel', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Tipo de Imóvel não pode ficar em branco')
  end
end

describe "Visitor tries to register a property type that is not unique" do
  it 'unsuccessfully' do
    PropertyType.create ({ name: 'Casa' })

    visit root_path
    click_on 'Cadastrar tipo de Imóvel'
    fill_in 'Tipo de Imóvel', with: 'Casa'
    click_on 'Enviar'

    expect(page).to have_content('Tipo de Imóvel já está em uso')
  end
end

describe "Visitor tries to register a new property location" do
  it 'successfully' do
    visit root_path
    click_on 'Cadastrar região'
    fill_in 'Região', with: 'Salvador'
    click_on 'Enviar'

    expect(page).to have_content('Imóveis da Região Salvador')
  end

  describe 'Visitor tries to register an empty property location' do
    it 'unsuccessfully' do
      visit root_path
      click_on 'Cadastrar região'
      fill_in 'Região', with: ''
      click_on 'Enviar'
  
      expect(page).to have_content('Região não pode ficar em branco')
    end
  end
  
  describe "Visitor tries to register a property location that is not unique" do
    it 'unsuccessfully' do
      PropertyLocation.create ({ name: 'Recife' })
  
      visit root_path
      click_on 'Cadastrar região'
      fill_in 'Região', with: 'Recife'
      click_on 'Enviar'
  
      expect(page).to have_content('Região já está em uso')
    end
  end
end

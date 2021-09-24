require 'rails_helper'

describe 'Visitor register property' do
  it 'successfully' do
    visit root_path
    click_on 'Cadastrar Imóvel'
    fill_in 'Título', with: 'Casa em Florianópolis'
    fill_in 'Descrição', with: 'Ótima casa perto da UFSC'
    fill_in 'Quartos', with: '3'
    fill_in 'Banheiros', with: '2'
    fill_in 'Diária', with: 200
    check 'Aceita Pets'
    check 'Vaga de Estacionamento'
    click_on 'Enviar'

    expect(page).to have_content('Casa em Florianópolis')
    expect(page).to have_content('Ótima casa perto da UFSC')
    expect(page).to have_content("Quartos: 3")
    expect(page).to have_content("Banheiros: 2")
    expect(page).to have_content("Aceita Pets: Sim")
    expect(page).to have_content("Estacionamento: Sim")
    expect(page).to have_content("Diária: R$ 200,00")
  end
end

describe 'Visitor register property type' do
  it 'successfully' do
    visit root_path
    click_on 'Cadastrar tipo de Imóvel'
    fill_in 'Tipo de Imóvel', with: 'Apartamento'
    click_on 'Enviar'

    expect(page).to have_content('Cadastro realizado com sucesso')
    expect(page).to have_content('Tipo de Imóvel: Apartamento')
  end
end

describe 'Visitor tries to register empty property type' do
  it 'unsuccessfully' do
    visit root_path
    click_on 'Cadastrar tipo de Imóvel'
    fill_in 'Tipo de Imóvel', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Cadastro inválido, preencha os campos corretamente')
  end
end

describe "Visitor tries to register a property type that is not unique" do
  it 'unsuccessfully' do
    PropertyType.create ({ name: 'Casa' })

    visit root_path
    click_on 'Cadastrar tipo de Imóvel'
    fill_in 'Tipo de Imóvel', with: 'Casa'
    click_on 'Enviar'

    expect(page).to have_content('Tipo de imóvel já existente no banco de dados')
  end
end

describe "Visitor tries to register a new property location" do
  it 'successfully' do
    visit root_path
    click_on 'Cadastrar região'
    fill_in 'Região', with: 'Salvador'
    click_on 'Enviar'

    expect(page).to have_content('Cadastro realizado com sucesso')
    expect(page).to have_content('Nova região: Salvador')
  end

  describe 'Visitor tries to register an empty property location' do
    it 'unsuccessfully' do
      visit root_path
      click_on 'Cadastrar região'
      fill_in 'Região', with: ''
      click_on 'Enviar'
  
      expect(page).to have_content('Cadastro inválido, preencha os campos corretamente')
    end
  end
  
  describe "Visitor tries to register a property location that is not unique" do
    it 'unsuccessfully' do
      PropertyLocation.create ({ name: 'Recife' })
  
      visit root_path
      click_on 'Cadastrar região'
      fill_in 'Região', with: 'Recife'
      click_on 'Enviar'
  
      expect(page).to have_content('Região já existente no banco de dados')
    end
  end
end

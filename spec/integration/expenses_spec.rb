require 'rails_helper'

RSpec.describe 'expenses#index', type: :system, js: true do
  before :each do
    @pogba = User.create(name: 'Paul Pogba', email: 'paul@talented.facts', password: 'password')

    @sports = @pogba.categories.create(name: 'Sports')
    @fashion = @pogba.categories.create(name: 'Fashion')

    @hair_cut = @fashion.expenses.create(name: 'Hair Cut', amount: 325, author: @pogba)
    @shades = @fashion.expenses.create(name: 'Shades', amount: 100, author: @pogba)

    visit category_expenses_path(@fashion)

    # Sign in the user
    fill_in 'user_email', with: @pogba.email
    fill_in 'user_password', with: @pogba.password
    click_on 'Log in'
  end

  it 'shows the expenses index page information' do
    expect(page).to have_content(@hair_cut.name)
    expect(page).to have_content(@shades.name)

    expect(page).to have_content('$325.00')
    expect(page).to have_content('$100.00')

    expect(page).to have_content('$425.00')
  end

  it 'shows a link to create a new transaction' do
    expect(page).to have_link('Add a new transaction', href: new_category_expense_path(@fashion))
  end
end

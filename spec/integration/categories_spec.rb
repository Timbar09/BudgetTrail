require 'rails_helper'

RSpec.describe 'categories#index', type: :system, js: true do
  before :each do
    @pogba = User.create(name: 'Paul Pogba', email: 'paul@talented.facts', password: 'password')

    @sports = @pogba.categories.create(name: 'Sports')
    @fashion = @pogba.categories.create(name: 'Fashion')

    @predator = @sports.expenses.create(name: 'Predator', amount: 200, author: @pogba)
    @hair_cut = @fashion.expenses.create(name: 'Hair Cut', amount: 325, author: @pogba)

    visit categories_path

    # Sign in the user
    fill_in 'user_email', with: @pogba.email
    fill_in 'user_password', with: @pogba.password
    click_on 'Log in'
  end

  it 'shows the categories index page information' do
    expect(page).to have_content(@sports.name)
    expect(page).to have_content(@fashion.name)

    expect(page).to have_content(@sports.icon.filename.to_s)
    expect(page).to have_css("img[src*='https://via.placeholder.com/150']")
  end

  it 'shows a link to each category\'s expenses and a link to create a new expense' do
    expect(page).to have_link(href: category_expenses_path(@sports))
    expect(page).to have_link(href: category_expenses_path(@fashion))

    expect(page).to have_link('Add a new category', href: new_category_path)
  end
end

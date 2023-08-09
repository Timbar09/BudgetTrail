require 'rails_helper'

RSpec.describe 'Expenses GET /index', type: :request do
  before :each do
    @cr7 = User.create(name: 'Cristiano', email: 'cr7@goat.baller', password: 'password')
    sign_in @cr7

    @sports = @cr7.categories.create(name: 'Football', author: @cr7)

    @mercurial = @sports.expenses.create(name: 'Mercurial Vapor', amount: 200, author: @cr7)
    @long_sleeve = @sports.expenses.create(name: 'Long Sleeve', amount: 169, author: @cr7)
  end

  it 'should get expences index page and render the index template' do
    get category_expenses_path(@sports)

    expect(response).to have_http_status(200)

    expect(response).to render_template(:index)
  end

  it 'should display the expenses information' do
    get category_expenses_path(@sports)

    expect(response.body).to include(@mercurial.name)
    expect(response.body).to include(@long_sleeve.name)

    expect(response.body).to include('$200.00')
    expect(response.body).to include('$169.00')

    expect(response.body).to include('$369.00')

    expect(response.body).to include('Add a new transaction')
  end
end

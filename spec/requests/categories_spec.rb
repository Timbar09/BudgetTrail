require 'rails_helper'

RSpec.describe 'Categories GET /index', type: :request do
  before :each do
    @cr7 = User.create(name: 'Cristiano', email: 'cr7@goat.baller', password: 'password')
    sign_in @cr7

    @sports = @cr7.categories.create(name: 'Football', author: @cr7)
    @modeling = @cr7.categories.create(name: 'Modeling', author: @cr7)

    @mercurial = @sports.expenses.create(name: 'Mercurial Vapor', amount: 200, author: @cr7)
    @face_mask = @modeling.expenses.create(name: 'Face Mask', amount: 10, author: @cr7)
  end

  it 'should get categories index page and render the index template' do
    get categories_path

    expect(response).to have_http_status(200)

    expect(response).to render_template(:index)
  end

  it 'should display the categories information' do
    get categories_path

    expect(response.body).to include(@sports.name)
    expect(response.body).to include(@modeling.name)

    expect(response.body).to include(@sports.icon.filename.to_s)
    expect(response.body).to include(@modeling.icon.filename.to_s)

    expect(response.body).to include('$210.00')

    expect(response.body).to include('Add a new category')
  end
end

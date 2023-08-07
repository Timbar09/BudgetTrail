require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'creation' do
    before :each do
      @cr7 = User.create(name: 'Cristiano', email: 'cr7@goat,baller', password: 'password')
      @category = @cr7.categories.create(name: 'Sports', author: @cr7)
    end

    it 'can be created' do
      expect(@category).to be_valid
    end

    it 'cannot be created without a name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'cannot be created with a name more than 25 characters' do
      @category.name = 'a' * 26
      expect(@category).to_not be_valid
    end
  end
end

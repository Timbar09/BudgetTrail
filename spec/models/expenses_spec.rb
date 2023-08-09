require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'creation' do
    before :each do
      @cr7 = User.create(name: 'Cristiano', email: 'cr7@goat.baller', password: 'password')
      @category = @cr7.categories.create(name: 'Football', author: @cr7)
      @expense = @category.expenses.create(name: 'Mercurial Vapor', amount: 200, author: @cr7)
    end

    it 'can be created' do
      expect(@expense).to be_valid
    end

    it 'cannot be created without a name' do
      @expense.name = nil
      expect(@expense).to_not be_valid
    end

    it 'cannot be created without an amount' do
      @expense.amount = nil
      expect(@expense).to_not be_valid
    end

    it 'cannot be created with an amount less than 0' do
      @expense.amount = -1
      expect(@expense).to_not be_valid
    end

    it 'cannot be created without an author' do
      @expense.author = nil
      expect(@expense).to_not be_valid
    end

    it 'cannot be created with a name more than 25 characters' do
      @expense.name = 'a' * 26
      expect(@expense).to_not be_valid
    end
  end
end

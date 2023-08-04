class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }, index: true
      t.string :name
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end

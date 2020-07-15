class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :card_token,     null: false
      t.references :item,       foreign_key: true

      t.timestamps
    end
  end
end

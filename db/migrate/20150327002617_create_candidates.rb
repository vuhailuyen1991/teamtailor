class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.text :skill
      t.string :phone

      t.timestamps null: false
    end
  end
end

class CreateAdjectives < ActiveRecord::Migration[6.0]
  def change
    create_table :adjectives do |t|
      t.string :text

      t.timestamps
    end
  end
end

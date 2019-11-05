class CreateNouns < ActiveRecord::Migration[6.0]
  def change
    create_table :nouns do |t|
      t.string :text

      t.timestamps
    end
  end
end

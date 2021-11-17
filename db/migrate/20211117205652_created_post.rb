class CreatedPost < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :name
      t.text :content

      t.timestamps
    end
  end
end

class CreatedComment < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :post, index: true, foreign_key: true
      t.text       :content_comment

      t.timestamps
    end
  end
end

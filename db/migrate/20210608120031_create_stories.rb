class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.string :name
      t.string :text
      t.string :image_url

      t.timestamps
    end
  end
end

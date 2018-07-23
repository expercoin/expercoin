class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :url
      t.string :name
      t.string :title
      t.text :description
      t.text :keywords
      t.references :content, polymorphic: true, index: true

      t.timestamps
    end
  end
end

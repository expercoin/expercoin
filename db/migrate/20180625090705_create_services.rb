class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :title
      t.string :cover_image
      t.string :cover_video
      t.text :content
      t.belongs_to :group, foreign_key: true

      t.timestamps
    end
  end
end

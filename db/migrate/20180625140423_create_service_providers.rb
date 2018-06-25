class CreateServiceProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :service_providers do |t|
      t.belongs_to :service, foreign_key: true
      t.belongs_to :profile, foreign_key: true
      t.boolean :featured, default: false

      t.timestamps
    end
  end
end

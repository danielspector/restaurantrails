class CreateViolations < ActiveRecord::Migration
  def change
    create_table :violations do |t|
      t.boolean :critical_vio
      t.string :vio_code
      t.text :description
    end
  end
end

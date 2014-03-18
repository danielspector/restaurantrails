class CreateUserViolations < ActiveRecord::Migration
  def change
    create_table :user_violations do |t|
      t.integer :user_id
      t.integer :violation_id
    end
  end
end

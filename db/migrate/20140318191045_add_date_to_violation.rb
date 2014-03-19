class AddDateToViolation < ActiveRecord::Migration
  def change
    add_column :violations, :end_date, :string
  end
end

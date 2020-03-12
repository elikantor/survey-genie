class AddInterestToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :interest, :string
  end
end

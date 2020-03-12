class AddTotalToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :total, :integer
  end
end

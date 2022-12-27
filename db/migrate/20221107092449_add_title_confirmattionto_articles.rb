class AddTitleConfirmattiontoArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :title_confirmation, :string
  end
end

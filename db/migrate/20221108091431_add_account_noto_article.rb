class AddAccountNotoArticle < ActiveRecord::Migration[7.0]
  def change
        add_column :articles, :account_no, :Integer
  end
end

class AddCompanyToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :company, :string
  end
end

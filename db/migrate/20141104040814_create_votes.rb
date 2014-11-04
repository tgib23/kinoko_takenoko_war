class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.text :party

      t.timestamps
    end
  end
end

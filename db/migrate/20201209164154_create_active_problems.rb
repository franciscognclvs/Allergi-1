class CreateActiveProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :active_problems do |t|
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.string :problem, null: false, default: ""
      t.timestamps
    end
  end
end

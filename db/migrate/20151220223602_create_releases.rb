class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.references :project, index: true, foreign_key: true
      t.string :github_release_id

      t.timestamps null: false
    end
  end
end

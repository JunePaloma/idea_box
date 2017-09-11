class CreateIdeaImages < ActiveRecord::Migration[5.1]
  def change
    create_table :idea_images do |t|
      t.referenes :image_id
      t.references :idea_id, foreign_key: true

      t.timestamps
    end
  end
end

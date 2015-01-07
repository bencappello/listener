class CreateBandTags < ActiveRecord::Migration
  def change
    create_table :band_tags do |t|
      t.integer :band_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end

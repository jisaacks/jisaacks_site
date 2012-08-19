class DropAttachments < ActiveRecord::Migration
  def up
    drop_table :attachments
  end

  def down
    create_table :attachments do |t|
      t.binary :data
      t.string :name
      t.string :format

      t.timestamps
    end
  end
end

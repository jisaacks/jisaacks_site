class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.binary :data
      t.string :name
      t.string :format

      t.timestamps
    end
  end
end

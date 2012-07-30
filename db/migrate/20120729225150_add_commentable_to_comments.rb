class AddCommentableToComments < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.remove_references :article
      t.references :commentable, :polymorphic => true
    end
  end
end

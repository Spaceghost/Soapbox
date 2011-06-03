class CreateAuthorships < ActiveRecord::Migration
  def change
    create_table :authorships do |t|
      t.references :user
      t.references :article

      t.timestamps
    end
    add_index :authorships, :user_id
    add_index :authorships, :article_id
  end
end


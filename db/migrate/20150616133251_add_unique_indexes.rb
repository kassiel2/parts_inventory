class AddUniqueIndexes < ActiveRecord::Migration
  def change
    add_index "options", ["name"], unique: true
    add_index "traits", ["name"], unique: true
  end
end

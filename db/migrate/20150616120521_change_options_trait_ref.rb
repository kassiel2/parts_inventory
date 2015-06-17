class ChangeOptionsTraitRef < ActiveRecord::Migration
  def change
    remove_reference :traits, :option
    add_reference :options, :trait, index: true, foreign_key: true
  end
end

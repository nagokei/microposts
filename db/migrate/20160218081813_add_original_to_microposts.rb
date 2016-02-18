class AddOriginalToMicroposts < ActiveRecord::Migration
  def change
    add_reference :microposts, :original, index: true, foreign_key: true
  end
end

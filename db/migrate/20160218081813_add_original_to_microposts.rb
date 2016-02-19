class AddOriginalToMicroposts < ActiveRecord::Migration
  def change
    add_reference :microposts, :original, index: true
  end
end

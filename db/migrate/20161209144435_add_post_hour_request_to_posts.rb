class AddPostHourRequestToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :overtime_request, :decimal, precision: 3, scale: 1, default: 0.0
  end
end

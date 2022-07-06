class RemoveColumnFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :commentable_id, :integer
  end
end

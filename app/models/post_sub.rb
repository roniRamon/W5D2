class PostSub < ApplicationRecord
  # validates :post_id, presence: { scope: :sub_id }

  belongs_to :post
  belongs_to :sub

end

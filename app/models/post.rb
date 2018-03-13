class Post < ApplicationRecord
  validates :title, :url, :author, presence: true
  validates :subs, presence: {message: "post must have one sub"}

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  has_many :post_subs,
    foreign_key: :post_id,
    class_name: :PostSub, dependent: :destroy, inverse_of: :post

  has_many :subs,
    through: :post_subs,
    source: :sub



end

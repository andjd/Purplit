class Sub < ActiveRecord::Base
  validates :title, :moderator_id, presence: true
  validates :title, uniqueness: true

  has_many :posts

  belongs_to :moderator,
    class_name: 'User',
    foreign_key: :moderator_id

end

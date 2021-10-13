class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :email, type: String
  field :password, type: String

  validates :email, presence: true
  validates :email, uniqueness: true

  validates :password, presence: true, on: :create
  validates :password, length: {minimum: 6}

end

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :phone, type: String
  field :name, type: String
  field :balance, type: Integer
  field :profile, type: String

  validates_uniqueness_of :phone
end

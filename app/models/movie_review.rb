class MovieReview
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  field :title, type: String
  field :year, type: String
  field :review, type: String
  field :rating, type: String
end

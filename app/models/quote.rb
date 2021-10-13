class Quote
  include Mongoid::Document
  include Mongoid::Timestamps
  field :quote, type: String
  field :author, type: String
  field :author_about, type: String
  field :tags, type: Array
  scope :tags_exits?, ->(search){where(:tags.in => [search])}
  scope :search_tag, ->(search){where(:tags.in => [search])}
end

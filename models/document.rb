class Document
  include Mongoid::Document
  include Mongoid::Timestamps

  field :document_id, type: String
  field :text, type: String
  field :details, type: String
end

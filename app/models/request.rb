class Request < Node
  has_many :responses, foreign_key: 'parent_id'

  accepts_nested_attributes_for :responses, reject_if: proc { |attributes| attributes['email'].blank? }
end

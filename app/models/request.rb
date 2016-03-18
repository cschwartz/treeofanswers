class Request < Node
  has_many :responses, foreign_key: 'parent_id'

  enum status: superclass.statuses.keys + %w(accepted)

  accepts_nested_attributes_for :responses, reject_if: :response_has_mail?

  def response_has_mail?(attributes)
    attributes['email'].blank?
  end
end

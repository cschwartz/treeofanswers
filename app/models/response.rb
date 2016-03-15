class Response < Node
  before_validation :owner_from_email
  attr_accessor :email

  belongs_to :user
  has_many :responses, foreign_key: 'parent_id'

  enum status: superclass.statuses.keys + %w{edited answered delegated accepted}

  accepts_nested_attributes_for :responses, reject_if: proc { |attributes| attributes['email'].blank? }

  def owner_from_email
    self.user = User.find_by_email @email unless @email.nil?
  end
end

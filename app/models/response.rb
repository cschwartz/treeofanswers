class Response < Node
  before_validation :owner_from_email
  after_validation :update_status
  attr_accessor :email

  belongs_to :user
  has_many :responses, foreign_key: 'parent_id'

  enum status: superclass.statuses.keys + %w{edited answered delegated answered_and_delegated accepted}

  accepts_nested_attributes_for :responses, reject_if: proc { |attributes| attributes['email'].blank? }

  validates :description, presence: true, if: :no_respondents?, unless: :open?
  validates :responses, length: {minimum: 1}, if: :no_description?, unless: :open?

  def owner_from_email
    self.user = User.find_by_email @email unless @email.nil?
  end

  def update_status
    if respondents? && description?
      self.status = :answered_and_delegated
    elsif respondents?
      self.status = :delegated
    elsif description?
      self.status = :answered
    end
  end

  def respondents?
    !responses.empty?
  end

  def no_respondents?
    responses.empty?
  end

  def no_description?
    !description?
  end
end

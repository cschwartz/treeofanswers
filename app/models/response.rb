class Response < Node
  before_validation :owner_from_email
  attr_accessor :email

  def owner_from_email
    self.user = User.find_by_email @email unless @email.nil?
  end
end

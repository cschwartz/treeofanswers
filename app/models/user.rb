class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :requests

  def build_request(num_responses: 2)
    request = self.requests.build
    num_responses.times { request.responses.build }
    request
  end
end

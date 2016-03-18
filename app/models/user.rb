class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :requests
  has_many :responses, inverse_of: :user

  def build_request(num_responses: 2)
    request = requests.build
    num_responses.times { request.responses.build }
    request
  end
end

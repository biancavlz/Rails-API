class AccessToken < ApplicationRecord
  validates :token, presence: true, uniqueness: true
  
  belongs_to :user
  after_initialize :set_access_token

  private

  def set_access_token
    self.token = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.hex(10)
      break token unless User.where(access_token: token).exists?
    end
  end
end

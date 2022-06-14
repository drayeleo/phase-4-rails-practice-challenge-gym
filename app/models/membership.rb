class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :gym_id, :client_id, :charge, presence: true
  # validates :client_id, uniqueness: true # come back to this line to potentially change to custom validation   https://guides.rubyonrails.org/active_record_validations.html#performing-custom-validations
  validate :one_membership_per_gym_per_client

  def one_membership_per_gym_per_client
    # byebug
    # if expiration_date.present? && expiration_date < Date.today
    #   errors.add(:expiration_date, "can't be in the past")
    # end
    existing_memberships = client.memberships.pluck(:gym_id)
    if existing_memberships.include?(gym_id)
      errors.add(
        :gym_id,
        "can't be a gym where this client already has a membership"
      )
    end
  end
end

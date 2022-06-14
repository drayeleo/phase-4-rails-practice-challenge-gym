class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :amount

  def amount
    object.memberships.pluck(:charge).sum
  end
end

class Orders::IndexSerializer < ActiveModel::Serializer
    attributes :accessible_item, :email, :location, :phone
  end
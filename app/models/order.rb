class Order < ApplicationRecord
    validates_presence_of :accessible_item, :email, :location, :phone 
    belongs_to :user
end

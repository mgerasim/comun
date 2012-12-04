class ClientsGroups < ActiveRecord::Base
  belongs_to :client
  belongs_to :group
  # attr_accessible :title, :body
end

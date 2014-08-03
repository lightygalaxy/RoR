class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :email, :role, :authentication_token
  self.root = false
end

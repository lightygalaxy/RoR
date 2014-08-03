module AuthHelpers
  def authWithUser (user)
    request.headers['X-AUTH-TOKEN'] = "#{user.authentication_token}"
  end

  def clearToken
    request.headers['X-AUTH-TOKEN'] = nil
  end
  
end
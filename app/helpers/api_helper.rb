module ApiHelper
  def validate_auth_token
    self.resource = User.find_by_authentication_token(params[:auth_token].blank? && request.headers["X-AUTH-TOKEN"])
    render :status => 401, :json => {errors: "Invalid Token"} if self.resource.nil?
  end

  def admin?
    user = User.find_by_authentication_token(params[:auth_token].blank? && request.headers["X-AUTH-TOKEN"])
    if user.nil?
      render :status => 401, :json => {errors: "Invalid Token"}
    else
      render :status => 403, :json => {errors: "Access Denied – Required Admin Access"} unless user.admin?
    end

  end

  def teacher?
    user = User.find_by_authentication_token(params[:auth_token].blank? && request.headers["X-AUTH-TOKEN"])
    if user.nil?
      render :status => 401, :json => {errors: "Invalid Token"}
    else
      render :status => 403, :json => {errors: "Access Denied – Required Teacher Access"} unless user.admin? || user.teacher?
    end

  end

  def student?
    user = User.find_by_authentication_token(params[:auth_token].blank? && request.headers["X-AUTH-TOKEN"])
    if user.nil?
      render :status => 401, :json => {errors: "Invalid Token"}
    else
      render :status => 403, :json => {errors: "Access Denied – Required Student Access"} unless user.admin? || user.student?
    end
  end
end

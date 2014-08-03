class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :token_authenticatable, :validatable

  def admin?
    role == 'admin'
  end

  def student?
    role == 'student'
  end
  
  def teacher?
    role == 'teacher'
  end
end

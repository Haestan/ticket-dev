class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #

  has_many :tickets

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validate :password_complexity

  def password_complexity
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./)
      errors.add :password, "doit inclure au moins une lettre minuscule, une lettre majuscule et un chiffre"
    end
  end

end

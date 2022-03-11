# frozen_string_literal: true
class User < ApplicationRecord
  before_save :tileize_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  def tileize_role
    self.role = self.role.titleize
  end
end

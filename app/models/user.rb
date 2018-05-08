class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one :profile

  attr_accessor :first_name, :last_name

  validates_presence_of :first_name, :last_name

  after_commit :create_profile, on: :create

  def create_profile
    Profile.create!(user_id: id, first_name: first_name, last_name: last_name)
  end
end

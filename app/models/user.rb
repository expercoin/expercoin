# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one :profile
  has_many :created_services, class_name: 'Service', foreign_key: 'owner_id'
  has_many :messages, foreign_key: :receiver_id
  has_many :transactions, foreign_key: :sender_id

  attr_accessor :first_name, :last_name

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email

  after_commit :create_profile, on: :create

  accepts_nested_attributes_for :profile

  def create_profile
    Profile.create!(user_id: id, first_name: first_name, last_name: last_name)
  end

  def send_confirmation_notification?
    false
  end
end

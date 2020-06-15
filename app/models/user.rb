class User < ApplicationRecord
  include ActiveModel::Validations

  has_many :categories
  has_many :snippets

  # Validation Checks For User Auth
  # Forces Presence of string values in form fields
  validates_presence_of :name, :password
  validates_uniqueness_of :name #, on: :create     # Forces Uniqueness of User.name in [User.create | New.HTML.erb]

  # Validates UserName to not use whitespaces or special characters
  validates_with NameValidator
  # validates_with PasswordValidator

  validates :password, format: { with: //,
      message: "Case Sensitive, Requirements: Numbers,letters, the following Special Characters are allowed: !,@,#,$,%,^,&,*,_,- ,=,+,/,\ "}


end

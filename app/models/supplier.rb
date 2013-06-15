class Supplier < ActiveRecord::Base
  attr_accessible :address, :comment, :company, :contactor, :email, :fax, :phone, :website
end

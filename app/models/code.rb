class Code < ActiveRecord::Base
  attr_accessible :code, :codeLength, :comment, :describe, :footprint, :manufacturer, :name, :parent_id, :partNum, :quantity, :unitprice
end

class StatementScore < ActiveRecord::Base
  belongs_to :statement
  belongs_to :review
end

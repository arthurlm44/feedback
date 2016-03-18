class Review < ActiveRecord::Base
  belongs_to :user
  has_many :statement_scores
  has_many :statements, through: :statement_scores
  has_many :ratings

  accepts_nested_attributes_for :statement_scores
end

class AdStats < ActiveRecord::Base
  validates_inclusion_of :adaction, :in => ["download", "install", "show", "click"], :message=>'adaction not correct'
end

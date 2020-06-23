class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  paginates_per 500
end

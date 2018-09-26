class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  :sorted_by

end

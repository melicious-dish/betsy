class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # QUESTION: overall --> protect from forgery?? how to secure user input?
end

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # QUESTION: overall --> protect from forgery?? how to secure user input?


  # QUESTION: should this instead be in a view helper?
  def convert_int_to_f(int)
    if int.class == Integer
      return int/100.to_f
    end
  end
end

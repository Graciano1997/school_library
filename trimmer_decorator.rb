require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    if @nameable.correct_name.size > 10
      @nameable.correct_name.slice(0..10)
    else
      @nameable.correct_name
    end
  end
end

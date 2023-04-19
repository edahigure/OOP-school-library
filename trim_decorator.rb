require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    arraynew = []
    array = @nameable.correct_name.chars
    array.each_with_index do |letter, idx|
      arraynew.push(letter) if idx < 10
    end
    arraynew.join
  end
end

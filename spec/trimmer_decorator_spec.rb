require_relative '../module/nameable'
require_relative '../module/trimmer_decorator'

describe BaseDecorator do
  context 'When testing the BaseDecorator class and its methods' do
    it 'BaseDecorator class Should have  :correct_name method' do
      nameable_item = Nameable.new
      trimmer_decorator_item = TrimmerDecorator.new(nameable_item)
      expect(trimmer_decorator_item).to respond_to(:correct_name)
    end
  end
end

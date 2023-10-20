require_relative ('decorator')
describe BaseDecorator do
    context 'base decorator class' do
        it '(classroom) should be an instance of Classroom class' do
            classroom = BaseDecorator.new('Room 2')
            expect(classroom).to be_instance_of BaseDecorator
        end
    end
end
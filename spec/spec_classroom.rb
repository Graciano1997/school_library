require_relative('../classroom')
describe Classroom do
    context 'classroom class' do
        it '(classroom) should be an instance of Classroom class' do
            classroom = Classroom.new('Room 2')
            expect(classroom).to be_instance_of Classroom
        end

        it '(classroom.label) should equal Room 2' do
            classroom = Classroom.new('Room 2')
            expect(classroom.label).to eql 'Room 2'
        end
    end
    context 'Unexpected label' do
        it '(label) should be nil if given label is nil' do
            classroom = Classroom.new(nil)
            expect(classroom.label).to be nil
        end

        it '(label) should be nil if given label is nil' do
            classroom = Classroom.new(0)
            expect(classroom.label).to be 0
        end
    end
end
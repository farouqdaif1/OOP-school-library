require_relative '../classroom'
require_relative '../student'
describe ClassRoom do
  context 'It should create classroom and add student' do
    classroom = ClassRoom.new('Label')

    it 'return correct label' do
      expect(classroom.label).to eq 'Label'
    end

    it 'return array of students' do
      student = Student.new('Label', 12, 'farouq', true)
      classroom.add_student(student)
      expect(classroom.students.length).to eq 1
    end
  end
end

require_relative '../student'
require_relative '../classroom'
require_relative '../person'

describe Student do
  context 'When providing student information' do
    classroom = ClassRoom.new('Label')
    person = Student.new(classroom, 22, 'Farouq', true)
    person_two = Student.new(classroom, 16, 'Farouq', false)

    it 'creates a student person' do
      expect(person.name).to eq 'Farouq'
    end

    it 'creates a student without permission' do
      expect(person_two.can_use_services?).to eq false
    end

    it 'adds student to classroom' do
      expect(person.classroom).to eq classroom
    end

    it 'should print custom message' do
      expect(person.play_hooky).to eq "¯\(ツ)/¯"
    end
  end
end

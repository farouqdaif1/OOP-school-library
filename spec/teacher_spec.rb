require_relative '../teacher'

describe Teacher do
  context 'When providing teacher information' do
    teacher = Teacher.new('Math', 40, 'Farouq')

    it 'creates a new teacher with the given parameters' do
      expect(teacher).to be_an_instance_of Teacher
    end

    it 'should detect the teacher age' do
      expect(teacher.age).to eq 40
    end

    it 'should detect the teacher name' do
      expect(teacher.name).to eq 'Farouq'
    end

    it 'should have always permission to use services' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end

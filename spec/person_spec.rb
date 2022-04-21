require_relative '../person'

describe Person do
  context 'When passing a name' do
    person = Person.new(25, true, 'Farouq')
    person_two = Person.new(12, false, 'Farouq')

    it 'should validate the age of the person created' do
      expect(person.age).to eq 25
      expect(person_two.age).to eq 12
    end

    it 'should return true if he can use service' do
      expect(person.can_use_services?).to eq true
    end

    it 'should return false if he cannot use service' do
      expect(person_two.can_use_services?).to eq false
    end

    it 'should add into rentals' do
      person.add_rentals({ person: 'ahd', Date: '16\\6\\2000', Book: 'ahd', author: 'ahd', id: 337 })
      expect(person.rentals.length).to eq 1
    end
  end
end

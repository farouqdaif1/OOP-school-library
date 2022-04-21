require_relative '../decorator'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'

describe 'test classes made for decoration' do
  person = Person.new(25, true, 'microverseinc')
  decorter = Decorator.new(person)
  capitalized_person = CapitalizeDecorator.new(person)
  capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
  it 'should return same  name' do
    expect(decorter.correct_name).to eq 'microverseinc'
  end
  it 'should capitalize the name' do
    expect(capitalized_person.correct_name).to eq 'Microverseinc'
  end
  it 'should trimmed the name' do
    expect(capitalized_trimmed_person.correct_name).to eq 'Microverse'
  end
end

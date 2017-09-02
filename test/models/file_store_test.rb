require 'test_helper'

class FileStoreTest < ActiveSupport::TestCase

  def setup
    @person_store = File.expand_path('../person_file_store_test.json', __FILE__)
  end

  test 'read' do
    persons = JSON.parse(File.open(@person_store, 'r'){ |file| file.read }) || {}
    persons = persons.keys.inject({}) { |h, id| h[id.to_i] = Person.new(id.to_i,  persons[id]); h }
    assert_equal('vasya', persons[1].name)
  end

  test 'write(persons)' do
    persons = JSON.parse(File.open(@person_store, 'r'){ |file| file.read })
    persons = persons.keys.inject({}) { |h, id| h[id.to_i] = Person.new(id.to_i,  persons[id]); h }
    persons = persons.values.inject({}) { |h, person| h[person.id] = person.to_h; h }
    File.open(@person_store, 'w'){ |file| file.puts JSON.generate(persons) }
    persons = JSON.parse(File.open(@person_store, 'r'){ |file| file.read }) || {}
    persons = persons.keys.inject({}) { |h, id| h[id.to_i] = Person.new(id.to_i,  persons[id]); h }
    assert_equal('vasya', persons[1].name)
  end
end

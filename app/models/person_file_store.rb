class PersonFileStore
  require 'json'

  def initialize
    @person_store = File.expand_path('../person_store.json', __FILE__)
  end

  def read
    persons = JSON.parse(File.open(@person_store, 'r', &:read)) || {}
    persons.keys.each_with_object({}) { |id, h| h[id.to_i] = Person.new(id.to_i, persons[id]); }
  end

  def write(persons)
    persons = persons.values.each_with_object({}) { |person, h| h[person.id] = person.to_h; }
    File.open(@person_store, 'w') { |file| file.puts JSON.generate(persons) }
  end
end

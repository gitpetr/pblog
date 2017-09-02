class PersonJsonApiStore
  require 'json'
  include HTTParty

  def initialize
    @person_store = File.expand_path('../person_json_api_store.json', __FILE__)
  end

  def read
    response = HTTParty.get('http://127.0.0.1:3000/persons')
    persons = response['result'] || {}
    persons.each.inject({}) { |h, obj| h[obj['id']] = Person.new(obj['id'], obj); h }
  end

  def write(persons)
    collection =  persons.values.map { |person| person.to_h }
    HTTParty.post('http://127.0.0.1:3000/persons/bulk_update',query: { collection: collection }
    )
  end
end

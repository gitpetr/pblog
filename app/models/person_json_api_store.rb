class PersonJsonApiStore
  require 'json'
  include HTTParty

  def initialize
    @person_store = File.expand_path('../person_json_api_store.json', __FILE__)
  end

  def read
    response = HTTParty.get('http://127.0.0.1:3000/persons')
    persons = response['result'] || {}
    persons.each.each_with_object({}) { |obj, h| h[obj['id']] = Person.new(obj['id'], obj); }
  end

  def write(persons)
    collection = persons.values.map(&:to_h)
    HTTParty.post('http://127.0.0.1:3000/persons/bulk_update', query: { collection: collection })
  end
end

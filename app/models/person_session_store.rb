class PersonSessionStore
  def initialize(session)
    @session = session
  end

  def read
    persons = @session[:persons] || {}
    persons.keys.each_with_object({}) { |id, h| h[id.to_i] = Person.new(id.to_i, persons[id]); }
  end

  def write(persons)
    @session[:persons] = persons.values.each_with_object({}) { |person, h| h[person.id] = person.to_h; }
  end
end

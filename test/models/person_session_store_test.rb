require 'test_helper'

class PersonSessionStoreTest < ActiveSupport::TestCase
  def setup
    @session = {}
    @session[:persons] = {1 => {"id" => 1,"name" => "vasya","email" => "q@ssd.we","date_of_birth" => "2222-02-11","salary" => "222"}, 3 => {"id" => 3,"name" => "dd","email" => "w@w.w","date_of_birth" => "1111-11-11","salary" => "1111"},4 => {"id" => 4,"name" => "Вася Попов","email" => "vasy@popov.com","date_of_birth" => "1969-12-12","salary" => "243333"}}
  end

  test 'read' do
    persons = @session[:persons] || {}
    persons = persons.keys.inject({}) { |h, id| h[id.to_i] = Person.new(id.to_i,  persons[id]); h }
    assert_equal('vasya', persons[1].name)
  end

  test 'write' do
    persons = @session[:persons]
    persons = persons.keys.inject({}) { |h, id| h[id.to_i] = Person.new(id.to_i,  persons[id]); h }
    @session[:persons] = {}
    @session[:persons] = persons.values.inject({}) { |h, person| h[person.id] = person.to_h; h }
    assert_equal('dd', @session[:persons][3][:name])
  end
end
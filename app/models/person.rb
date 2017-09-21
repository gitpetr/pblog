class Person
  include ActiveModel::Model

  READ_FIELDS = %i[id].freeze
  WRITE_FIELDS = %i[name email date_of_birth salary].freeze
  ALL_FIELDS = READ_FIELDS + WRITE_FIELDS

  READ_FIELDS.each { |field| attr_reader field }
  WRITE_FIELDS.each { |field| attr_accessor field }

  def initialize(id, attrs)
    @id = id
    WRITE_FIELDS.each { |field| send("#{field}=", attrs[field.to_s]) }
  end

  def to_h
    ALL_FIELDS.each_with_object({}) { |field, h| h[field] = send(field); }
  end
end

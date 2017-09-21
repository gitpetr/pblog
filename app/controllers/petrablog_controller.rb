class PetrablogController < ApplicationController
  before_action :setup_person_manager
  before_action :set_person, only: %i[show edit update destroy]
  def index; end

  def show; end

  def new
    @person = Person.new(0, {})
  end

  def create
    @person = @person_factory.build params[:person]
    @person_manager.set_person @person
    @person_manager.save_persons
    redirect_to petrablog_index_path, success: 'Пользователь успешно добавлен'
  end

  private

  def setup_person_manager
    @person_manager = PersonManager.new(PersonJsonApiStore.new)
    @person_factory = PersonFactory.new(@person_manager.max_id)
  end

  def set_person
    @person = @person_manager.get_person(params[:id].to_i)
  end
end

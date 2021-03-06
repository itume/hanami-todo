require_relative '../../../spec_helper'

describe Web::Controllers::Todos::Index do
  let(:action) { Web::Controllers::Todos::Index.new }
  let(:params) { Hash[] }
  let(:repository) { TodoRepository.new }

  before do
    repository.clear

    @todo = repository.create(title: 'todo1', descripton: 'todo')
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all books' do
    action.call(params)
    action.exposures[:todos].must_equal [@todo]
  end
end

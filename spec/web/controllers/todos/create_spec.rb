require_relative '../../../spec_helper'

describe Web::Controllers::Todos::Create do
  let(:action) { Web::Controllers::Todos::Create.new }
  let(:params) { Hash[todo: { title: 'todo!', description: 'todotodo' }] }
  let(:repository) { TodoRepository.new }

  before do
    repository.clear
  end
  
  it 'creates a new todo' do
    action.call(params)
    todo = repository.last

    todo.id.wont_be_nil
    todo.title.must_equal params.dig(:todo, :title)
  end

  it 'redirects the user to the todos listing' do
    response = action.call(params)

    response[0].must_equal 302
    response[1]['Location'].must_equal '/todos'
  end
end

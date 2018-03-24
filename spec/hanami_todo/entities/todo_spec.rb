require_relative '../../spec_helper'

describe Todo do
  it 'can be initialized with attributes' do
    todo = Todo.new(title: 'HanamiでTodoする', description: '色々やる' )
    todo.title.must_equal 'HanamiでTodoする'
    todo.description.must_equal '色々やる'
  end
end

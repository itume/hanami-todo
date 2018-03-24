require_relative '../../../spec_helper'

describe Web::Views::Todos::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/todos/index.html.erb') }
  let(:view)      { Web::Views::Todos::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #todo' do
    view.todo.must_equal exposures.fetch(:todos)
  end

  describe 'when there are no todos' do
    it 'shows a placeholder message' do
      rendered.must_include('<p class="placeholder">There are no todos yet.</p>')
    end
  end

  describe 'when there are todos' do
    let(:todo1)     { Todo.new(title: 'Todo1', author: 'todo') }
    let(:todo2)     { Todo.new(title: 'Todo2', author: 'todotodo') }
    let(:exposures) { Hash[todos: [todo1, todo2]] }

    it 'lists them all' do
      rendered.scan(/class="todo"/).count.must_equal 2
      rendered.must_include('Todo1')
      rendered.must_include('Todo2')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('<p class="placeholder">There are no todos yet.</p>')
    end
  end
end

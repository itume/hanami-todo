require 'features_helper'

describe 'Add a todo' do
  after do
    TodoRepository.new.clear
  end

  it 'can create a new todo' do
    visit '/todos/new'

    within 'form#todo-form' do
      fill_in 'Title',  with: 'New todo'
      fill_in 'Description', with: 'Some description'

      click_button 'Create'
    end

    current_path.must_equal('/todos')
    assert page.has_content?('New todo')
  end
end

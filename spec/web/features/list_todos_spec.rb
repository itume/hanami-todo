require 'features_helper'

describe 'List todos' do
    let(:repository) { TodoRepository.new }
    before do
        repository.clear
    
        repository.create(title: 'テスト', description: 'テストで作成')
        repository.create(title: 'テスト2',   descrption: 'テストテスト')
    end

    it 'displays each todos on the page' do
    visit '/todos'

    within '#todos' do
      assert page.has_css?('.todo', count: 2), 'Expected to find 2 todos'
    end
  end
end

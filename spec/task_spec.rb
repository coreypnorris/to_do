require ('rspec')
require ('task')

describe Task do
  it 'is initialized with a description' do
    test_task = Task.new('wash the dishes')
    test_task.should be_an_instance_of Task
  end
  it 'lets you read the description out' do
    test_task = Task.new('wash the dishes')
    test_task.description.should eq 'wash the dishes'
  end
end

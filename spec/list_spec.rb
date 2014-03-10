require ('rspec')
require ('list')

describe List do
  it 'is initialized with a description' do
    test_list = List.new('Chores')
    test_list.should be_an_instance_of List
  end
  it 'lets you read the description out' do
    test_list = List.new('Chores')
    test_list.description.should eq 'Chores'
  end
end

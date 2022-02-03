
require 'rails_helper'

describe User do
  fixtures :users

  it 'create a simple when the name is present and is unique, and the age >= 0 when it is present' do
    User.create(name: 'Test name', age: 50, biography: 'A biography')
    expect(User.count).to eq 2
  end
  
  it 'does not create a user when the username is already in the database' do    
    expect(User.create(name: users(:trainee).name)).not_to be_valid
  end

  it 'does not create a user with empty name' do
    expect(User.create(name: nil)).not_to be_valid
  end
  
  it 'does not create a user when the age is less than zero' do
    expect(User.create(name: 'Another user', age: -1, biography: 'Not a trainee at codeminer')).not_to be_valid
  end
end

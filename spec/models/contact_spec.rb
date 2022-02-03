require 'rails_helper'

describe Contact do
  fixtures :users, :contacts

  it 'create a contact when (name, user_id) is present and unique' do  
    Contact.create(name: "Hello", birthday: "11/11/1989", user_id: users(:trainee).id)
    expect(Contact.count).to eq 2
  end
  
  it 'does not create a contact when name is present but (name, user_id) is not unique' do
    expect(Contact.create(name: contacts(:contact_one).name, birthday: "11/11/1911", user_id: contacts(:contact_one).user_id)).not_to be_valid
  end

    it ' does not create a contact when name is not present' do
    expect(Contact.create(name: nil, birthday: "11/11/1989", user_id: users(:trainee).id)).not_to be_valid
  end
end

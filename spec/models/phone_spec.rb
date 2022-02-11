require 'rails_helper'

describe Phone do
  fixtures :contacts, :phones

  it 'creates phone if all fields are present, (contact_id, number) is unique, (contact_id, main:True) is unique, main is in [true, false] and kind is in [home, work, other]' do
    contacts(:contact_one).phones.create number: '7777-7777', kind: 'work', main: false
    expect(Phone.count).to eq 3
  end

  it 'does not create a phone when (contact_id, number) is not unique' do
    expect(contacts(:contact_one).phones.create(number: phones(:phone_contact_one).number, kind: 'work', main: true)).not_to be_valid
  end
  
  it 'does not create a phone when (contact_id, main:True) is not unique' do
    expect(contacts(:contact_one).phones.create(number: '7777-7777', kind: 'work', main: true)).not_to be_valid
  end

  it 'does not create a phone when number is not  present' do
    expect(contacts(:contact_one).phones.create(number: nil, kind: 'work', main: false)).not_to be_valid
  end

  it 'does not create a phone when kind is not  present' do
    expect(contacts(:contact_one).phones.create(number: '8888-8888', kind: nil, main: false)).not_to be_valid
  end

  it 'does not create a phone when kind is not in [home, work, other]' do
    expect(contacts(:contact_one).phones.create(number: '8888-8888', kind: 'other_kind', main: false)).not_to be_valid
  end

  it 'does not create a phone when main is not present' do
    expect(contacts(:contact_one).phones.create(number: '8888-8888', kind: 'other', main: nil)).not_to be_valid
  end

  it 'does not create a phone when main is not in [true, false]' do
    expect(contacts(:contact_one).phones.create(number: '8888-8888', kind: 'other', main: 2)).not_to be_valid
  end

  it 'does not create a phone when contact_id is not present' do
    expect(Phone.create(number: '8888-8888', kind: 'other', main: false, contact_id: nil)).not_to be_valid
  end
end

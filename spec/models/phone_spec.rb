require 'rails_helper'

describe Phone do
  fixtures :contacts, :phones

  it 'creates phone if all fields are present, (contact_id, main:True) is unique, main is in [true, false] and kind is in [home, work, other]' do
    Phone.create(number: '7777-7777', kind: 'work', main: false, contact_id: contacts(:contact_one).id)
    expect(Phone.count).to eq 3
  end

  it 'does not create a phone when (contact_id, main:True) is not unique' do
    expect(Phone.create(number: '7777-7777', kind: 'work', main: true,
                        contact_id: contacts(:contact_one).id)).not_to be_valid
  end

  it 'does not create a phone when number is not  present' do
    expect(Phone.create(number: nil, kind: 'work', main: false, contact_id: contacts(:contact_one).id)).not_to be_valid
  end

  it 'does not create a phone when kind is not  present' do
    expect(Phone.create(number: '8888-8888', kind: nil, main: false,
                        contact_id: contacts(:contact_one).id)).not_to be_valid
  end

  it 'does not create a phone when kind is not in [home, work, other]' do
    expect(Phone.create(number: '8888-8888', kind: 'other_kind', main: false,
                        contact_id: contacts(:contact_one).id)).not_to be_valid
  end

  it 'does not create a phone when main is not present' do
    expect(Phone.create(number: '8888-8888', kind: 'other', main: nil,
                        contact_id: contacts(:contact_one).id)).not_to be_valid
  end

  it 'does not create a phone when main is not in [true, false]' do
    expect(Phone.create(number: '8888-8888', kind: 'other', main: 2,
                        contact_id: contacts(:contact_one).id)).not_to be_valid
  end

  it 'does not create a phone when contact_id is missing' do
    expect(Phone.create(number: '8888-8888', kind: 'other', main: false, contact_id: nil)).not_to be_valid
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do

  it 'first name invald' do
      user= User.create(
        first_name: nil,
        last_name: 'Test',
        email: 'test@gmail.com',
        password: '123456'
      )

      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
  end

  it 'last name invald' do
    user= User.create(
        first_name: 'Test',
        last_name: nil,
        email: 'test@gmail.com',
        password: '123456'
      )

      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
  end

  it 'first name and last name invald' do
    user= User.create(
      first_name: nil,
      last_name: nil,
      email: 'test@gmail.com',
      password: '123456'
    )

    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
    expect(user.errors[:last_name]).to include("can't be blank")

  end

  it 'first name and last name valid' do
    user= User.create(
      first_name: 'Test',
      last_name: 'Test',
      email: 'test@gmail.com',
      password: '123456'
    )

    user.valid?
    
    #byebug

    expect(user.errors[:first_name]).to eq([])
    expect(user.errors[:last_name]).to eq([])
  end

  it 'email invald' do
    user= User.create(
      first_name: 'Test',
      last_name: 'Test',
      email: nil,
      password: '123456'
    )

    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'email has already' do
    user_1= User.create(
      first_name: 'Test',
      last_name: 'Test',
      email: "test@gmail.com",
      password: '123456'
    )

    user_2= User.create(
      first_name: 'Test',
      last_name: 'Test',
      email: "test@gmail.com",
      password: '123456'
    )

    user_2.valid?
    expect(user_2.errors[:email]).to include("has already been taken")
  end

  it 'return full name' do
    user= User.create(
      first_name: 'Test',
      last_name: 'Test',
      email: "test@gmail.com",
      password: '123456'
    )

    expect(user.name).to eq("Test Test")
  end

end

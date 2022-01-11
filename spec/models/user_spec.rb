require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'password' do
      it 'not save for password length < 5 chars' do
        user = User.new(first_name: 'Alice', last_name: 'Li', email: 'hi@live.ca', password: '1234', password_confirmation: '1234')
        user.save
        expect(user.errors.full_messages.include?('Password is too short (minimum is 5 characters)')).to be_truthy
      end
      it 'not save when password does not match password_confirmation' do
        password = '12345'
        password_confirmation = '12435'
        user = User.new(first_name: 'Alice', last_name: 'Li', email: 'hi@live.ca', password: password, password_confirmation: password_confirmation)
        expect(user.save).to be_falsey
      end
      it 'save when password matches password_confirmation' do
        password = '12345'
        password_confirmation = '12345'
        user = User.new(first_name: 'Alice', last_name: 'Li', email: 'hi@live.ca', password: password, password_confirmation: password_confirmation)
        expect(user.save).to be_truthy
      end
    end

    context 'essential fields' do
      it 'not save for un-unique emails' do
        user1 = User.new(first_name: 'Alice', last_name: 'Li', email: "test@test.com", password: '12345', password_confirmation: '12345')
        user2 = User.new(first_name: 'Alice', last_name: 'Lee', email: "TEST@TEST.com", password: '12645', password_confirmation: '12645')
        user1.save
        user2.save
        expect(user2.errors.full_messages.include?('Email has already been taken')).to be_truthy
      end
      it 'not save for empty email field' do
        user = User.new(first_name: 'Alice', last_name: 'Li', email: nil, password: 'hi', password_confirmation: 'hi')
        user.save
        expect(user.errors.full_messages.include?("Email can't be blank")).to be_truthy
      end
      it 'not save for empty first_name field' do
        user = User.new(first_name: nil, last_name: 'Li', email: 'test@test.com', password: 'hi', password_confirmation: 'hi')
        user.save
        expect(user.errors.full_messages.include?("First name can't be blank")).to be_truthy
      end
      it 'not save for empty last_name field' do
        user = User.new(first_name: 'Alice', last_name: nil, email: 'test@test.com', password: 'hi', password_confirmation: 'hi')
        user.save
        expect(user.errors.full_messages.include?("Last name can't be blank")).to be_truthy
      end
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @email = 'alice@test.com'
      @password = 'apple123'
      @user = User.create(first_name: 'Alice', last_name: 'Li', email: @email, password: @password, password_confirmation: @password)
    end

    it 'returns user upon success authentication' do
      user = User.authenticate_with_credentials(@email, @password)
      expect(user).not_to be_nil
    end
    it 'returns nil upon failed authentication' do
      user = User.authenticate_with_credentials(@email, 'apple124')
      expect(user).to be_nil
    end

    context 'email and password' do
      it 'corrects for extra whitespace before/after email' do
        user = User.authenticate_with_credentials(' ' + @email + ' ', @password)
        expect(user).not_to be_nil
      end
      it 'corrects for email case insensitivities' do
        user = User.authenticate_with_credentials('AlicE@TESt.cOM', @password)
        expect(user).not_to be_nil
      end
    end
  end
end

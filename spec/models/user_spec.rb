require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do

  	context 'when initialized without args' do

  		before do
  			@user = User.new
  		end

  		it 'cannot be saved to the database' do
  			status = @user.save
  			expect(status).to eq(false)
  		end

  	end

  	context 'when initialized with unmatching password and password confirmation' do

  		before do 
  			@user = User.new(
  				name: 'Harry',
  				email: 'harry@gmail.com',
  				password: 'bumblebee',
  				password_confirmation: 'flintntinder'
  			)
  		end

  		it 'cannot be saved to the database' do
  			status = @user.save
  			expect(status).to eq(false)
  		end

  	end

  	context 'when initialized with matching password and password confirmation' do
  		before do
  			@user = User.new(
  				name: 'Harry',
  				email: 'harry@gmail.com',
  				password: 'bumblebee',
  				password_confirmation: 'bumblebee'
  			)
  		end

  		it 'is can be saved to the database' do
  			status = @user.save
  			expect(status).to eq(true)
  		end
  	end

  end
end

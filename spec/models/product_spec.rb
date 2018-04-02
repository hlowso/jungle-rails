require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'validations' do
  	it { should validate_presence_of(:name) }
  	it { should validate_presence_of(:price) }
  	it { should validate_presence_of(:quantity) }
  	it { should validate_presence_of(:category) }
  end
end

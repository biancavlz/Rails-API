require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "#validations" do
    it 'should have a valid factory' do
      expect(build :comment).to be_valid
    end
  end
end

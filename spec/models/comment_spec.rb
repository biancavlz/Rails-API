require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "#validations" do
    it 'should have a valid factory' do
      expect(build :comment).to be_valid
    end

    it 'should test presence of attributes' do
      comment = build :comment, content: ''

      expect(comment).not_to be_valid
      expect(comment.errors.messages[:content]).to include("can't be blank")
    end
  end
end

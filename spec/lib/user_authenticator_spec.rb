require 'rails_helper'
require 'user_authenticator'

describe 'UserAuthenticator' do
  describe '#perform' do
    context 'when the code is incorrect' do
      it 'should raise an error' do
        authenticator = UserAuthenticator.new('sample_code')
        expect{ authenticator.perform }.to raise_error(
          UserAuthenticator::AuthenticationError
        )
        expect(authenticator.user).to be_nil
      end
    end
  end
end
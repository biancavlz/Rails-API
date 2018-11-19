require 'rails_helper'
require 'user_authenticator'

describe 'UserAuthenticator' do
  describe '#perform' do
    let(:authenticator) { UserAuthenticator.new('sample_code') }
    subject(:perform) { authenticator.perform }
    
    context 'when the code is incorrect' do
      let(:error) { double('Sawyer::Resource', error: 'bad_verification_code') }
      
      before do
        allow_any_instance_of(Octokit::Client).to receive(
          :exchange_code_for_token).and_return(error)
      end
      
      it 'should raise an error' do
        expect{ perform }.to raise_error(
          UserAuthenticator::AuthenticationError
        )
        expect(authenticator.user).to be_nil
      end
    end

    context 'when the code is correct' do
      let (:user_data) do {
          login: 'jsmith1', 
          avatar_url: 'http://myexample.com/avatar',
          url: 'http://myexample.com',
          name: 'John Smith'
        }
      end
      before do
        allow_any_instance_of(Octokit::Client).to receive(
          :exchange_code_for_token).and_return('validaccesstoken')

        allow_any_instance_of(Octokit::Client).to receive(
          :user).and_return(user_data)
      end

      it 'should save the user when does not exist' do
        expect{ perform }.to change{ User.count }.by(1)
        expect(User.last.name).to eq 'John Smith'
      end

      it 'should reuse already registered user' do
        user = create :user, user_data

        expect{ subject }.not_to change { User.count }
        expect(authenticator.user).to eq(user)
      end
    end
  end
end
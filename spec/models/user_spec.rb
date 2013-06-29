require 'spec_helper'

describe User do

  let(:user) { Fabricate :user, password: 'secret', email: 'test@happyland.com' }

  context '#authenticated' do

    it 'returns true with proper credentials' do
      expect(user.authenticated?('secret')).to be_true
    end

    it 'returns false withouth proper credentials' do
      expect(user.authenticated?('wrong password')).to be_false
    end

  end

end

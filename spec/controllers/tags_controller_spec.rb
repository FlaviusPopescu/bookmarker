require 'spec_helper'

describe TagsController do

  context 'GET' do

    before { controller.stub(current_user: true) }

    it 'responds with empty array if query is an empty string' do
      get :index, query: '', format: :json

      expect(response.body).to eq([].to_json)
    end

  end

end

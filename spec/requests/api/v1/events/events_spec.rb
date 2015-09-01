require 'spec_helper'

describe 'GET /v1/events/:id' do
  it 'returns an event by :id' do
    event = create(:event)

    get "/v1/events/#{event.id}"

    expect(response_json).to eq({
      'address' => event.address,
      'ended_at' => event.ended_at,
      'id' => event.id,
      'lat' => event.lat,
      'lon' => event.lon,
      'name' => event.name,
      'started_at' => event.started_at.as_json,
      'owner' => {
        'id' => event.owner.id
      }
    })
  end
end

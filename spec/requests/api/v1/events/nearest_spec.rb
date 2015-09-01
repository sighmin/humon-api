require 'spec_helper'

describe 'GET /v1/events/nearests?lat=&lon=&radius=' do
  it 'returns the events closest to the lat and lon' do
    near_event = create(:event, lat: 37.760322, lon: -122.429667)
    farther_event = create(:event, lat: 37.760321, lon: -122.429667)
    create(:event, lat: 37.687737, lon: -122.470608)

    lat = 37.771098
    lon = -122.430782
    radius = 5

    get "/v1/events/nearests?lat=#{lat}&lon=#{lon}&radius=#{radius}"

    expect(response_json).to eq([{
      'address' => near_event.address,
      'ended_at' => near_event.ended_at,
      'id' => near_event.id,
      'lat' => near_event.lat,
      'lon' => near_event.lon,
      'name' => near_event.name,
      'started_at' => near_event.started_at.as_json,
      'owner' => { 'id' => near_event.owner.id }
    },
    {
      'address' => farther_event.address,
      'ended_at' => farther_event.ended_at,
      'id' => farther_event.id,
      'lat' => farther_event.lat,
      'lon' => farther_event.lon,
      'name' => farther_event.name,
      'started_at' => farther_event.started_at.as_json,
      'owner' => { 'id' => farther_event.owner.id }
    }])
  end
end

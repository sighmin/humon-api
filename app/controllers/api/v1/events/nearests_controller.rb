class Api::V1::Events::NearestsController < ApiController
  def index
    @events = Event.near(
      [params[:lat], params[:lon]],
      params[:radius],
      units: :km
    )
  end
end

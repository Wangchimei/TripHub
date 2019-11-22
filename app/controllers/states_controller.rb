class StatesController < ApplicationController
  def index
    @states = State.all
    respond_to do |format|
      format.html
      format.csv do
        send_data render_to_string, filename: "states.csv", type: :csv
      end
    end
  end
end
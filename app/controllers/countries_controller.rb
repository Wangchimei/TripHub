class CountriesController < ApplicationController
  def index
    @countries = Country.all

    respond_to do |format|
      format.html
      format.csv do
        send_data render_to_string, filename: "countries.csv", type: :csv
      end
    end
  end
end

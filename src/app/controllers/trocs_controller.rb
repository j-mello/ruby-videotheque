class TrocsController < ApplicationController
    before_action :authenticate_user!, only: [:index]

    # Get /trocs
    def index
    end
end
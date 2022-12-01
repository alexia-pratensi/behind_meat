class DaysController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new ]
end

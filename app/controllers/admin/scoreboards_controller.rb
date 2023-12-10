class Admin::ScoreboardsController < ApplicationController
  before_action :authenticate_admin!
end

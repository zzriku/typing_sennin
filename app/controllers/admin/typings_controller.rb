class Admin::TypingsController < ApplicationController
  before_action :authenticate_admin!
end

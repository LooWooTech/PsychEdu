class AskController < ApplicationController
  layout 'ask'
  before_action :user_required
end

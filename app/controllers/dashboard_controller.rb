class DashboardController < ApplicationController
  def index
    @total_services = Service.count
    @active_services = Service.where(active: true).count
    @inactive_services = Service.where(active: false).count

    @average_price = Service.average(:price)&.round(2) || 0

    @recent_services = Service.order(created_at: :desc).limit(5)
  end
end
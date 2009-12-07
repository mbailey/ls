class Admin::DashboardController < Admin::BaseController
  def index
    @animals = Animal.limit(5)
    @carers = Carer.limit(5)
    @placements = Placement.limit(5)

  end
end

class PlacementSearch
  attr_accessor :query, :kind, :hours_at_home, :level_of_experience

  def initialize(params)
    @params = params
    params_to_attributes
  end

  def all
    return Carer.all# if @params.blank?
    # TODO actual search filtering of carers
  end

  def params_to_attributes
    return if @params.blank?
    @params.each do |k, v|
      send(:"#{k}=", v) if respond_to?(:"#{k}=")
    end
  end

end

class Admin::ConditionsController < Admin::ResourceController

  belongs_to :product, :find_by => :permalink

end

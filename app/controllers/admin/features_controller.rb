class Admin::FeaturesController < Admin::ResourceController

  belongs_to :product, :find_by => :permalink

end

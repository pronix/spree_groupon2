Image.class_eval do
  attachment_definitions[:attachment][:styles] = {
    :mini => '48x48>', # thumbs under image
    :small => '100x100>', # images on category view
    :product => '425x200#', # full product image
    :large => '610x300#'  # light box image
  }
end

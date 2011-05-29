class SpreeGroupon2Hooks < Spree::ThemeSupport::HookListener
  insert_after :admin_inside_head do
    '<%= javascript_include_tag "application" %>'
  end
#  replace :homepage_products, 'shared/products_main' 
  replace :products_list_item, 'shared/product_list_item'
end

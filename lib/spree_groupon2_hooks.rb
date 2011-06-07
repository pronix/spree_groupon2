class SpreeGroupon2Hooks < Spree::ThemeSupport::HookListener
  insert_after :admin_inside_head do
    '<%= javascript_include_tag "application" %>'
  end
end

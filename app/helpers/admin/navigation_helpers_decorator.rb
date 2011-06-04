module Admin::NavigationHelper

  def link_to_approve(resource, options = {}, html_options={})
    options.assert_valid_keys(:url, :caption, :title, :dataType, :success, :name)

    options.reverse_merge! :url => object_url(resource) unless options.key? :url
    options.reverse_merge! :caption => t('are_you_sure')
    options.reverse_merge! :title => t('confirm_approve')
    options.reverse_merge! :dataType => 'script'
    options.reverse_merge! :success => "function(r){ jQuery('##{dom_id resource}').fadeOut('hide'); }"
    options.reverse_merge! :name => icon("edit") + ' ' + t("approve")

    link_to_function_approve(options, html_options)
  end

  def link_to_function_approve(options, html_options)
    link_to_function options[:name], "jConfirm('#{options[:caption]}', '#{options[:title]}', function(r) {
      if(r){ #{link_to_function_approve_ajax(options)} }
    });", html_options
  end

  def link_to_function_approve_ajax(options)
    %Q{
      jQuery.ajax({
        type: 'POST',
        url: '#{options[:url]}',
        data: ({_method: 'put', authenticity_token: AUTH_TOKEN}),
        dataType:'#{options[:dataType]}',
        success: #{options[:success]}
      });
    }
  end

end

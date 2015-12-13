module AdminApp
  module SidebarHelper
    def sidebar_dropdown_link title
      link_to '#', default_sidebar_options do
        [
          content_tag(:span, title),
          content_tag(:span, nil, class: 'caret')
        ].join.html_safe
      end
    end

    private

    def default_sidebar_options
      {
        class: 'dropdown-toggle',
        data: {
          toggle: 'dropdown'
        },
        aria: {
          haspopup: true,
          expanded: false
        },
        role: 'button'
      }
    end
  end
end

require 'will_paginate/view_helpers/action_view'

module WillPaginate
  module ActionView
    def will_paginate(collection = nil, options = {})
      options, collection = collection, nil if collection.is_a? Hash
      # Taken from original will_paginate code to handle if the helper is not passed a collection object.
      collection ||= infer_collection_from_controller
      options[:renderer] ||= BootstrapLinkRenderer
      super.try :html_safe
    end

    class BootstrapLinkRenderer < LinkRenderer
      protected

      def html_container(html)
        container_attributes[:class] = 'b-pagination'
        tag :div, tag(:ul, html, class: 'pagination'), container_attributes
      end

      def page_number(page)
        tag :li, link(page, page, rel: rel_value(page)), class: ('active' if page == current_page)
      end

      def gap
        tag :li, link('&hellip;'.html_safe, '#'), class: 'disabled'
      end

      def previous_page
        if @options[:show_previous_label].present?
          num = @collection.current_page > 1 && @collection.current_page - 1
          previous_or_next_page(num, @options[:previous_label], 'previous_page')
        end
      end

      def previous_or_next_page(page, text, classname)
        tag :li, link(text, page || '#'),
          class: [
            (classname[0..3] if  @options[:page_links]),
            (classname if @options[:page_links])
          ].join(' ') if page
      end
    end
  end
end

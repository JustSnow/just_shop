module AdminApp
  module AdminHelper
    def spinner size = 'fa-4x'
      content_tag :div, class: 'l-spinner' do
        content_tag :i, nil, class: ['fa fa-spinner fa-spin', size].join(' ')
      end
    end
  end
end

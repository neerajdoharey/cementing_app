module ApplicationHelper
  def link_to_add_row(name, class_name, f, association, **args)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize, f: builder)
    end
    if class_name == "staff_deployed"
      link_to(name, 'javascript:void(0);', class: "unit_add_fields " + args[:class], data: {id: id, classname: class_name, fields: fields.gsub("\n", "")})
    else
      link_to(name, 'javascript:void(0);', class: "add_fields " + args[:class], data: {id: id, classname: class_name, fields: fields.gsub("\n", "")})
    end
  end

  def will_paginate(collection_or_options = nil, options = {})
    if collection_or_options.is_a? Hash
      options, collection_or_options = collection_or_options, nil
    end
    unless options[:renderer]
      options = options.merge :renderer => BootstrapRenderer
    end
    super *[collection_or_options, options].compact
  end

  class BootstrapRenderer < WillPaginate::ActionView::LinkRenderer
    protected
    def html_container(html)
      tag :nav, tag(:ul, html, class: "pagination pagination-sm"), container_attributes
    end

    def page_number(page)
      tag :li, link(page, page, rel: rel_value(page), class: 'page-link'),
        class: (page == current_page ? 'page-item active': 'page-item')
    end

    def previous_or_next_page(page, text, classname)
      tag :li, link(text, page || '#', class: 'page-link'),
        class: ['page-item', classname, ('disabled' unless page)].join(' ')
    end
  end
end

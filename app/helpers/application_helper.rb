

module ApplicationHelper


  def nav_link(link_text, link_path)

    master = link_path.split('/').last
    values = request.original_url.split('/')
    class_name = values.include?(master) ? 'current' : nil
    content_tag(:li, :class => class_name) do
      link_to link_text, link_path, class: 'nav-link'
    end
  end

  def branch_nav_link(link_text, link_path)

    class_name = current_page?(link_path) ? 'section sub-current' : 'section'

    link_to link_text, link_path, class: class_name
  end

  def branch_nav_link_put(link_text, link_path)

    class_name = current_page?(link_path) ? 'section sub-current' : 'section'

    link_to link_text, link_path, class: class_name, method: :put
  end

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Model United Nations at UCSD"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end


  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id

    if association.to_s == "questions"
      new_object.answers.build
    end

    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to('#', class: "add_fields admin-link", data: {id: id, fields: fields.gsub("\n", "")}) do
      content_tag(:div, name, class: 'event-a')
    end
  end

  def parent_schedule_path(prefix, parent, schedule)
     "/" + parent.class.name.demodulize + "/schedules/" + schedule.id + "/" + prefix
  end

  def get_parent
    parent_klasses = %w[branch hconference]
    if klass = parent_klasses.detect { |pk| params[:"#{pk}_id"].present? }
      klass.camelize.constantize.friendly.find params[:"#{klass}_id"]
    end

  end
end
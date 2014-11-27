module ApplicationHelper



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
    link_to(name, '#', class: "add_fields admin-link", data: {id: id, fields: fields.gsub("\n", "")})
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
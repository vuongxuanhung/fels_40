module LessonsHelper
  def create_add_word_button name, f, words
    new_object = f.object.class.reflect_on_association(words).klass.new

    4.times {new_object.answers.build}

    fields = f.fields_for(words, new_object) do |builder|
      render "word_fields", f: builder
    end

    link_to(name, "javascript:void(0);",
      onclick: h("add_fields(this, \"#{escape_javascript(fields)}\")"))
  end
end

module WordsHelper
  def create_add_word_button name, f, words
    new_object = f.object.class.reflect_on_association(words).klass.new

    4.times {new_object.answers.build}

    fields = f.fields_for words, new_object, child_index: "new_#{words}" do |builder|
      render words.to_s.singularize + "_fields", f: builder
    end

    link_to(name, "javascript:void(0);",
      onclick: h("add_fields(this, \"#{words}\", \"#{escape_javascript(fields)}\")"))
  end

  def create_add_answer_button name, f, answers
    new_object = f.object.class.reflect_on_association(answers).klass.new

    fields = f.fields_for answers, new_object, child_index: "new_#{answers}" do |builder|
      render answers.to_s.singularize + "_fields", f: builder
    end

    link_to(name, "javascript:void(0);",
      onclick: h("add_fields(this, \"#{answers}\", \"#{escape_javascript(fields)}\")"))
  end
end

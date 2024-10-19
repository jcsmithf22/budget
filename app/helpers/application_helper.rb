module ApplicationHelper
  def error_for(model, field)
    if model.errors.include?(field)
      content_tag :div, class: "form__input-error" do
        model.errors.full_messages_for(field).first
      end
    end
  end
end

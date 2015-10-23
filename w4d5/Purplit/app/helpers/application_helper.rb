module ApplicationHelper

  def auth_token
    <<-HTML.html_safe
      <input type="hidden" name="authenticity_token" value="#{form_authenticity_token}">
    HTML
  end

  def rails_verb(obj)
    verb = obj.persisted? ? "PATCH" : "POST"
    <<-HTML.html_safe
      <input type="hidden" name="_method" value="#{h(verb)}">
    HTML
  end

  def rails_delete
    <<-HTML.html_safe
      <input type="hidden" name="_method" value="DELETE">
    HTML
  end
end

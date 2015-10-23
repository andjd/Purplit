module ApplicationHelper

  def auth_token
    <<-HTML.html_safe
      <input type="hidden" name="authenticity_token" value="#{form_authenticit_token}">
    HTML


  end

  def rails_verb(verb)
    <<-HTML.html_safe
        <input type="hidden" name="_method" value:"#{h(verb)}">
      HTML
end

defmodule Dispatcher do
  use Matcher
  
  # Define the return types the dispatcher accepts
  define_accept_types [
    html: [ "text/html", "application/xhtml+html" ],
    json: [ "application/json", "application/vnd.api+json" ],
  ]

  # Define shorthands for which types should actually be accepted
  @any %{}
  @json %{ accept: %{ json: true } }

  # In order to forward the 'themes' resource to the
  # resource service, use the following forward rule.
  #
  # docker-compose stop; docker-compose rm; docker-compose up
  # after altering this file.
  #
  # match "/themes/*path" do
  #   Proxy.forward conn, path, "http://resource/themes/"
  # end

  # Match for the login service
  match "/sessions/*path", @any do
    Proxy.forward conn, path, "http://login/sessions/"
  end

  # Match for the mocklogin service
  match "/mock/sessions/*path", @any do
    Proxy.forward conn, path, "http://mocklogin/sessions/"
  end

  # Last call, nothing found...
  match "_", %{ last_call: true } do
    send_resp( conn, 404, "Route not found.  See config/dispatcher.ex" )
  end

end

# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class ApplicationThemeExtension < Radiant::Extension
  version "1.0"
  description "Adds the ability to append to or override the default stylesheets and javascripts"
  url "http://saturnflyer.com/"
  
  def activate
    ApplicationController.class_eval{ include ApplicationTheme::ApplicationOverride }
  end
  
  def deactivate
  end
  
end
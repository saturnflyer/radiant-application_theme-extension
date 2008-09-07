module ApplicationTheme::ApplicationOverride
  def self.included(base)
    base.class_eval {
      @@methods_after_set_javascripts_and_stylesheets ||= []
      def self.methods_after_set_javascripts_and_stylesheets
        @@methods_after_set_javascripts_and_stylesheets
      end
      remove_method :set_javascripts_and_stylesheets

      private
      
      def set_javascripts_and_stylesheets
        @stylesheets ||= []
        @stylesheets << %w(admin/main)
        @stylesheets.flatten!
        @javascripts ||= []
        @javascripts << %w(prototype string effects admin/tabcontrol admin/ruledtable admin/admin)
        @javascripts.flatten!
        after_set_javascripts_and_stylesheets(@@methods_after_set_javascripts_and_stylesheets)
      end
  
      def after_set_javascripts_and_stylesheets(collection)
        collection.each do |method|
          self.send(method.to_sym)
        end
      end
    }
  end
end
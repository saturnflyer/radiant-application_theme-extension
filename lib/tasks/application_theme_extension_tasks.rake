namespace :radiant do
  namespace :extensions do
    namespace :application_theme do
      
      desc "Runs the migration of the Application Theme extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          ApplicationThemeExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          ApplicationThemeExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Application Theme to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from ApplicationThemeExtension"
        Dir[ApplicationThemeExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(ApplicationThemeExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end

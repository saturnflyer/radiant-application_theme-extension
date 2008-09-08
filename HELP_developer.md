You can add stylesheet or javascript files to the Radiant interface 
with Application Theme. Here is some sample code that you could put
in an extension to alter the user interface:

	ApplicationController.class_eval{
		ApplicationController.methods_after_set_javascripts_and_stylesheets << :add_inline_help_files

		def add_inline_help_files
			@stylesheets << 'admin/help'
		end
	}
	
The help_inline extension makes use of Application Theme to add the
help stylesheet to the entire application so that each partial added
to the interface isn't required to call `include_stylesheet`.
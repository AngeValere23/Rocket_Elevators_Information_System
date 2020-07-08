# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( header.css )
Rails.application.config.assets.precompile += %w( blue.css )
Rails.application.config.assets.precompile += %w( layout.css )
Rails.application.config.assets.precompile += %w( essentials.css )
Rails.application.config.assets.precompile += %w( js/plugins/slider.revolution/css/extralayers.css )
Rails.application.config.assets.precompile += %w( js/plugins/slider.revolution/css/settings.css)
Rails.application.config.assets.precompile += %w( js/view/demo.revolution_slider.js )
Rails.application.config.assets.precompile += %w( js/plugins/slider.revolution/js/jquery.themepunch.revolution.min.js )
Rails.application.config.assets.precompile += %w( js/plugins/slider.revolution/js/jquery.themepunch.tools.min.js )
Rails.application.config.assets.precompile += %w( js/scripts.js )
Rails.application.config.assets.precompile += %w( js/validator.min.js )
Rails.application.config.assets.precompile += %w( plugins/select2/js/select2.full.min.js )
Rails.application.config.assets.precompile += %w( plugins/select2/js/select2.min.js )
Rails.application.config.assets.precompile += %w( plugins/select2/js/select2.full.min (1).js )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

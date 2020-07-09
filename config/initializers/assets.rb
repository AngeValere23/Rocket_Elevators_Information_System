# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( css/header-1.css )
Rails.application.config.assets.precompile += %w( css/color_scheme/red.css )
Rails.application.config.assets.precompile += %w( css/layout.css )
Rails.application.config.assets.precompile += %w( css/essentials.css )
Rails.application.config.assets.precompile += %w( js/quote.js )
Rails.application.config.assets.precompile += %w( js/scripts.js )
Rails.application.config.assets.precompile += %w( js/newsletter.js )
Rails.application.config.assets.precompile += %w( js/revolution_slider.js )
Rails.application.config.assets.precompile += %w( js/contact.js )

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

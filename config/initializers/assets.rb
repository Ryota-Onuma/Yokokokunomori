# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( home )
Rails.application.config.assets.precompile += %w( professors/professors_new )
Rails.application.config.assets.precompile += %w( professors/professors_index )
Rails.application.config.assets.precompile += %w( professors/professors_show )
Rails.application.config.assets.precompile += %w( lectures/lecture_new )
Rails.application.config.assets.precompile += %w( lectures/lecture_index)
Rails.application.config.assets.precompile += %w( lectures/lecture_show)
Rails.application.config.assets.precompile += %w( tags/rateProf)
Rails.application.config.assets.precompile += %w( tags/rateLec)
Rails.application.config.assets.precompile += %w( fontawesome-stars)
Rails.application.config.assets.precompile += %w( opinions)
Rails.application.config.assets.precompile += %w( aboutweb)
Rails.application.config.assets.precompile += %w( howtouse)
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

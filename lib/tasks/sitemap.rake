require 'big_sitemap'

namespace :custom do
  desc "Generate sitemap"
  task :sitemap => :environment do
    include Rails.application.routes.url_helpers

    sitemap_options = {
      document_root: Rails.root.join('public'),
      url_options: { host: 'insomniax.biz' },
      ping_google: true,
      ping_bing: true,
      gzip: true
    }

    if Rails.env.development?
      sitemap_options = {
        document_root: Rails.root.join('public'),
        url_options: { host: 'localhost', port: 3000 },
        ping_google: false,
        ping_bing: false,
        gzip: false
      }
    end

    BigSitemap.generate(sitemap_options) do
      add root_path, change_frequency: 'daily', priority: 1.0

      Article.all.each do |article|
        add article_path(article), change_frequency: 'daily', priority: 0.5
      end
      ForumThread.all.each do |forum_thread|
        add forum_thread_path(forum_thread), change_frequency: 'daily', priority: 0.5
      end
    end
  end
end

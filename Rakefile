task :build do
  recipe = ENV['recipe'] || 'recipes/*/{recipe,[0-9]*}.rb'
  Dir.glob(recipe) do |file|
    system "fpm-cook clean #{file} && " \
           "sudo fpm-cook install-deps #{file} && " \
           "fpm-cook package #{file} && " \
           "fpm-cook clean #{file}"
  end
end

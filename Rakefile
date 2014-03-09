task :build do
  Dir.glob('recipes/*/*.rb') do |file|
    system "sudo fpm-cook install-deps #{file} && " +
           "fpm-cook package #{file} && " +
           "fpm-cook clean #{file}"
  end
end

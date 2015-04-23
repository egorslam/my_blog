task :resizeimg => :environment do
  blog = Blog.all
  blog.each do |f|
    f.blogimg.recreate_versions! if f.blogimg?
  end
end
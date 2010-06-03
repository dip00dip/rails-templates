# set some constants
APP_DIRNAME = File.basename(root)
APP_NAME = APP_DIRNAME.classify
APP_DOMAIN = "#{APP_DIRNAME}.info"

# Set up git repository
git :init

# remove all useless public files
run "rmdir tmp/{pids,sessions,sockets,cache}"
run "rm README"
run "rm log/*.log"
run "rm public/index.html"
run "rm public/javascripts/*"
run "rm public/favicon.ico"
run "rm public/images/rails.png"
run "rm public/robots.txt"
run "rm -rf test"
run "rm -rf doc"
run "rm config/locales/*"

# keep empty dirs
run("find . \\( -type d -empty \\) -and \\( -not -regex ./\\.git.* \\) -exec touch {}/.gitkeep \\;")

# basic .gitignore file
file '.gitignore', 
%q{log/*.log
log/*.pid
db/*.db
db/*.sqlite3
db/schema.rb
tmp/**/*
.DS_Store
Thumbs.db
doc/api
doc/app
config/database.yml
autotest_result.html
coverage
public/javascripts/*_packaged.js
public/stylesheets/*_packaged.css
public/attachments
}

# copy sample database config
run "cp config/database.yml config/database.yml.sample"

# copy some files
file "config/locales/ru.yml", open("http://github.com/svenfuchs/rails-i18n/raw/master/rails/locale/ru.yml").read
file "public/javascripts/jquery.js", open("http://code.jquery.com/jquery-1.4.2.min.js").read
file "public/javascripts/application.js", <<-TXT
/*
  Your application package
*/
TXT

git :submodule => "init"
git :add => "."
git :commit => %(-m "Bootstrapping #{APP_NAME}")


# ------- # 
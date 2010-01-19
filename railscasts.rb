# HELLO
run "echo 'Example Railscasts Application' > README"

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

generate :nifty_layout
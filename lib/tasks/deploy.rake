
def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
end

def gray(str);   colorize(str, 30); end
def red(str);    colorize(str, 31); end
def green(str);  colorize(str, 32); end
def yellow(str); colorize(str, 33); end
def blue(str);   colorize(str, 34); end
def purple(str); colorize(str, 35); end
def neon(str);   colorize(str, 36); end

namespace :deploy do

  desc "Deploy to heroku"
  task :heroku do
    # Make sure branch is clean
    git_status=`git status 2> /dev/null`
    unless git_status =~ /working directory clean/
      raise red("You have uncommited changes.")
    end
    # Check for heroku branch
    branches = `git branch`
    unless branches =~ / heroku\n/
      raise red("heroku branch not found")
    end
    # Get current branch
    current_branch = branches.match(/\* ([^\n]*)/)[1]
    unless current_branch == "master"
      raise red("You must be on master branch to deploy")
    end

    puts blue("Preparing to deploy master to heroku")
    `git checkout heroku`
    `git merge master`
    `rake assets:precompile`
    `git add .`
    `git commit -m 'precompile assets'`
    `git push heroku heroku:master`
    `git checkout master`
    puts green("Success!")
  end

end
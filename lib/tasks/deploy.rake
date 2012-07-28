
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
    name = `whoami`
    git_status=`git status 2> /dev/null`
    if git_status =~ /working directory clean/
      puts green("Preparing to deploy")
    else
      print red("WARNING: ")
      puts yellow("You have uncommited changes.")
      puts yellow("You cannot deploy with uncommited changes!")
    end
  end

end
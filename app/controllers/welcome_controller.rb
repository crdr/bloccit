class WelcomeController < ApplicationController
  def index
    @posts = Posts.all
    puts "VALUE OF @posts VARIABLE IN INDEX CONTROLLER: #{@posts.inspect}"
  end

  def about
  end

  def contact
  end
end

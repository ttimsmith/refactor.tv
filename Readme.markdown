# Refactor.tv

This is the website for [Refactor.tv](http://refactor.tv). Enjoy.


## Running Locally

**Note:** We are using Ruby 1.9.3 both on Heroku and locally.

Get the source (obviously)

    $ git clone https://github.com/refactortv/refactor.tv.git
    $ cd refactor.tv

We use Postgres locally. If you don't have it already, you'll need to install Postgres. You can do this easily with [Homebrew](https://github.com/mxcl/homebrew):

    $ brew install postgresql

(Be sure and read the caveats after it installs. You must run some additional commands to get it to complete the installation.) You can also use [Postgres.app](http://postgresapp.com) if that's more your thing.

Run the following queries to setup the user in Postgres:

    $ psql postgres
    # CREATE USER refactortv SUPERUSER;\q

Now all you need to do to get going, all you need to is bundle (you'll need to install [Bundler](http://gembundler.com) if you don't have it with `gem install bundler`) and setup the database:

    $ bundle install
    $ rake db:create
    $ rake db:schema:load

Now you can start the server:

    $ bundle exec rails server

Then open <http://localhost:3000> in your browser to see it running. If you have issues getting it up and running, [send us an email](mailto:hi@refactor.tv).


### Admin

The default credentials for the admin area are `admin` and `passw0rd`. These are obviously different on production or if you have environment variables for `ADMIN_USERNAME` and `ADMIN_PASSWORD`.

To access the admin, go to <http://localhost:3000/admin>.

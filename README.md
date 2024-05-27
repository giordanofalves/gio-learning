# Welcome to the Kubicle Take Home Assignment - Rails Backend

## Introduction

Thank you for taking the time to attempt the Kubicle take home assignment. To help you get up and running quickly we have provided a basic backend application which you can expand as part of the assignment.

This is the **Ruby on Rails** version of backend.

## Running

Make sure you have Ruby installed. If you don't we recommend using [Ruby Version Manager](https://rvm.io/) or [Rbenv](https://github.com/rbenv/rbenv) to install and manage your Ruby installs. See their websites on instructions on how to install the latest version of Ruby.

You will also need SQLite3 installed on your system. See [the Sqlite website](https://www.sqlite.org/) for instructions on installing for your environment.

Once you have Ruby installed and you have cloned this repo, install Bundler and run it to manage your Ruby gems. This will install Rails and any other required Ruby gems.

```
gem install bundler
bundle install
```

Once this has been completed you can created the SQLite3 database by running

```
bin/rails db:setup
```

Once you have set up your database start the server by running

```
bin/rails server
```

to start the server running on port `3000`.

To test the server is running correctly make the following curl request

```
curl localhost:3000/courses
```

you should see a JSON response of the `courses` we seeded the database with.

Congratulations, you have set up the Rails backend for your Kubicle take home assignment.


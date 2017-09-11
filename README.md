# Parser

## Background

Receives a log as argument
  e.g.: ./parser.rb webserver.log

b. Returns the following:

  > list of webpages with most page views ordered from most pages views to less page views
     e.g.:
         /home 90 visits
         /index 80 visits
         etc...
  > list of webpages with most unique page views also ordered
     e.g.:
         /about/2   8 unique views
         /index     5 unique views
         etc...


## Running the program

In command line, type

```
./bin/parser.rb <path_to_log_file>
```

## Running the tests

In command line, type

```
bundle exec rspec
```

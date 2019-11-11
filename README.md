# Logfile parser

This is a script that takes a logfile, processes it and outputs a list of page paths and visits ordered by the number of visits in descending order.  Users can indicate whether they want a count of all visits or unique visits for a page.  This has been written using Ruby and tested using RSpec.

## Installation

```sh
$ git clone git@github.com:emmabeynon/sp_test.git
$ cd sp_test
$ bundle install
```

## Usage

For all page visits:
```sh
$ ruby lib/parser.rb path/to/logfile
```

For unique page visits:
```sh
$ ruby lib/parser.rb path/to/logfile --unique
```
## Running the test suite

```sh
$ bundle exec rspec
```

A test coverage report can be obtained by running:

```sh
$ open coverage/index.html
```

## Approach

In this implementation I've focused on creating small classes that each have a responsibility for a single part of processing the given logfile to produce the ordered list of page visits.  As an MVP, this produces a minimal output of the page path and count of visits.  Additionally, I've added an option to get unique visits by deduplicating paths that are visited multiple times by the same IP address.

Future iterations could include a more elaborate output, such as a table with column outlines.  There is light validation of the paths by the LogValidator, and we could make this more robust by disallowing certain characters from the path.  IP addresses are also lightly validated and we could enforce a check using a stricter IP format pattern.  Additionally I have designed the VisitCountOrderer to make it easy extendable so that it could, for example, order visits in ascending order should that be a requirement in future.

## What could be done differently

The Parser class is tightly coupled to the processing classes (LogValidator, PageVisitCounter, VisitCountOrderer and VisitsPrinter).  This is ok for now while I don't anticipate any need for flexibility in what is counted or how it is ordered, however we could make this more flexible by using dependency injection to easily switch out different classes in the Parser.  An alternative approach would be to create a rake task to process the logfile and produce the desired output instead of running a script.  The advantage of this is we could create different rake tasks for different needs which will use the individual classes as needed and possibly remove the need for the Parser class.  For example, a separate task could be created for unique visits, which would negate the need to pass a flag to the script.

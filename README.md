# React CRUD

## Code Coverage

To the exact code coverage, you can bypass spring and run code coverage with following command:

```bash
COVERAGE=true DISABLE_SPRING=true bundle exec rake test:all
```

This will run both unit and system tests

Instead of this rake task, we still have two options:

* rails test
* rails test:system

Don't forget the bundle exec 😉
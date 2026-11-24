# Rails Survey Demo + RSpec

[![RSpec](https://github.com/red-ruby-quay/rails-survey-demo/actions/workflows/rspec.yml/badge.svg)](https://github.com/red-ruby-quay/rails-survey-demo/actions/workflows/rspec.yml)

A small Rails 7.1 application used as a learning project for real-case RSpec/Capybara testing. Users can create surveys and submit responses with a score from 1 to 5.

## What this repo demonstrates

- Rails CRUD with nested resources (`surveys` and `responses`)
- Model validations and a derived metric (`average_score`)
- Request specs for HTTP behavior
- System specs that drive the UI with Capybara
- Transactional tests and CI with GitHub Actions
- A small, readable schema with foreign keys

## Stack

- Ruby 3.2.4
- Rails 7.1
- SQLite
- RSpec Rails
- Capybara
- GitHub Actions

## Setup

```bash
bundle install
bin/rails db:prepare
bin/rails db:seed
bin/rails server
```

Open http://localhost:3000.

## Run the specs

```bash
bundle exec rspec
```

Run one file:

```bash
bundle exec rspec spec/system/survey_flow_spec.rb
```

## Structure

```
app/
  controllers/      SurveysController, ResponsesController
  models/           Survey, Response
  views/            Layout, survey index/new/show
db/migrate/         surveys, responses
spec/
  models/           validations and average score
  requests/         create, list, invalid input, nested response
  system/           end-to-end form flow with Capybara
```

## What to extend next

- Add score distribution and a simple chart
- Add CSV export for responses
- Add authentication for survey owners
- Add pagination for responses
- Replace the system spec driver with Playwright for cross-browser E2E

## Notes

All seed data is fictional. This repo contains no BPS code, data, or configuration.

## Author

Rihan Yosral — QA Automation Engineer · https://github.com/red-ruby-quay

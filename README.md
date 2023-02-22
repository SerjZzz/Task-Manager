# TaskManager

[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2FSerjZzz%2FTask-Manager%2Fbadge%3Fref%3Ddevelop&style=popout)](https://actions-badge.atrox.dev/SerjZzz/Task-Manager/goto?ref=develop)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)
[![Coverage Status](https://coveralls.io/repos/github/SerjZzz/Task-Manager/badge.svg?branch=develop)](https://coveralls.io/github/SerjZzz/Task-Manager?branch=develop)

See the [test production server](https://task-manager-zk3v.onrender.com/) available at render(dot)com.

TaskManager is a Trello-like project that uses the [React-kanban library](https://github.com/asseinfo/react-kanban).
The project was designed as part of an educational course at [DualBootPartners Inc.](https://dualbootpartners.com/).

It is my pioneer effort in developing leading-edge applications based on the technology stack below:

- [Ruby](https://github.com/ruby/ruby)
  - [RubyOnRails](https://github.com/rails/rails)
- [ReactJS](https://github.com/facebook/react)
  - [ReduxJS](https://github.com/reduxjs/redux)
    - [React-rdeux](https://github.com/reduxjs/react-redux)
    - [Redux Toolkit](https://github.com/reduxjs/redux-toolkit)

## Table of contents

- [TaskManager](#taskmanager)
  - [Table of contents](#table-of-contents)
  - [Installation](#installation)
    - [Building the project with Docker-compose](#building-the-project-with-docker-compose)
      - [Build docker image](#build-docker-image)
      - [Install Rails dependencies](#install-rails-dependencies)
      - [Create Rails database](#create-rails-database)
      - [Webpacker install and compile assets](#webpacker-install-and-compile-assets)
      - [Interactive bash session](#interactive-bash-session)
      - [Up and run docker-compose image](#up-and-run-docker-compose-image)
  - [Test suite](#test-suite)
    - [Rails tests](#rails-tests)
    - [Check code-styles with Rubocop](#check-code-styles-with-rubocop)
    - [JavaScript linter](#javascript-linter)
  - [Environment variables](#environment-variables)
    - [Rubyconfig Gem](#rubyconfig-gem)
    - [Production ENV variables](#production-env-variables)

## Installation

TaskManager uses [Docker-compose](https://github.com/docker/compose).

### Building the project with Docker-compose

All you need to build the project is install Docker and follow the steps below from project working directory.

#### Build docker image

```bash
docker-compose build
```

#### Install Rails dependencies

```bash
docker-compose run --rm web bash -c "bundle install"
```

#### Create Rails database

```bash
docker-compose run --rm web bash -c "bundle exec rails db:create db:migrate"
```

#### Webpacker install and compile assets

To install run:

```bash
docker-compose run --rm web bash -c "bundle exec rails webpacker:install"
```

To compile run:

```bash
docker-compose run --rm web bash -c "bundle exec rails assets:precompile && bundle exec rails webpacker:compile"
```

#### Interactive bash session

Run interactive bash session if you need to access into the docker container:

```bash
docker-compose run --rm --service-ports web /bin/bash
```

#### Up and run docker-compose image

```bash
docker-compose up
```

## Test suite

### Rails tests

Run all the tests inside the container.

Run Rails test suite using the code below:

```bash
bundle exec rails test
```

### Check code-styles with Rubocop

Execute Ruby and RubyOnRails code-styles tests using the command inside the container:

```bash
bundle exec rubocop -a
```

### JavaScript linter

ESlint with Prettier tests can be run via the yarn linter:

```bash
yarn lint
```

## Environment variables

### Rubyconfig Gem

All the custom ENV variables configured with [Rubyconfig Gem](https://github.com/rubyconfig/config).

### Production ENV variables

- `.env` file includes all the settings and private keys.
- `.env.example` file includes all the settings and private keys with empty variables from `.env` file. Copy that file and fill it with valid values when you deploy the project in the new environment.

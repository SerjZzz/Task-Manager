# TaskManager

[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2FSerjZzz%2FTask-Manager%2Fbadge%3Fref%3Ddevelop&style=popout)](https://actions-badge.atrox.dev/SerjZzz/Task-Manager/goto?ref=develop)

TaskManager is a Trello-like project that uses the [React-kanban library](https://github.com/asseinfo/react-kanban)
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
      - [Up and run docker-compose image](#up-and-run-docker-compose-image)
      - [Install Rails dependencies](#install-rails-dependencies)
      - [Interactive bash session](#interactive-bash-session)
  - [Test suite](#test-suite)
    - [Rails tests](#rails-tests)
    - [Check code-styles with Rubocop](#check-code-styles-with-rubocop)
    - [JavaScript linter](#javascript-linter)

## Installation

TaskManager uses [Docker-compose](https://github.com/docker/compose).

### Building the project with Docker-compose

All you need to build the project is install Docker and follow the steps below from project working directory.

#### Build docker image

```bash
docker-compose build
```

#### Up and run docker-compose image

```bash
docker-compose up
```

#### Install Rails dependencies

```bash
docker-compose run --rm web bash -c "bundle install"
```

#### Interactive bash session

Run interactive bash session if you need to access into the docker container:

```bash
docker-compose run --rm --service-ports web /bin/bash
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

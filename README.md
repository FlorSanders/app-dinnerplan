# Dinner Plan - Backend

Backend to support the [DinnerPlan frontend](https://github.com/FlorSanders/frontend-dinnerplan) webapp.
The stack is built starting from [mu-project](https://github.com/mu-semtech/mu-project).

## Prerequisites

- [Docker engine](https://docs.docker.com/engine/install/)
- [Docker compose](https://docs.docker.com/compose/install/)

## Installation

- Clone the repository

  ```sh
  git clone https://github.com/FlorSanders/app-dinnerplan.git
  cd app-payback
  ```

- Boot up all services using docker-compose

  ```sh
  docker-compose up -d
  ```

- Allow cross-origin requests in order to use YASGUI

  - Visit [localhost:8890](http://localhost:8890) in your browser.
  - Log into conductor with dba:dba.
  - Go to Web Application Server >> Virtual Domains & Directories >> {Default Web Site}.
  - Edit `/sparql`.
  - Add `*` to the `Cross-Origin Resource Sharing` field.

- Install FCT package

  - Visit [localhost:8890](http://localhost:8890) in your browser.
  - Log into conductor with dba:dba.
  - Go to System Admin >> Packages.
  - Click on FCT >> Install.
  - Click on proceed.

## Usage

- Booting up

  ```sh
  docker-compose up -f docker-compose.yml -f docker-compose.dev.yml -d
  ```

  - Alternatively, you can create a `.env` file with a `COMPOSE_FILE` environment variable.

    ```
    COMPOSE_FILE=docker-compose.yml:docker-compose.dev.yml
    ```

    and run `docker-compose up -d`.

- Shutting down

  ```sh
  docker-compose stop
  ```

- Cleaning up

  ```
  docker-compose rm
  ```

## Configuration

Setting up your environment is done in three easy steps: first you configure the running microservices and their names in `docker-compose.yml`, then you configure how requests are dispatched in `config/dispatcher.ex`, and lastly you start everything.

### Hooking things up with docker-compose

Alter the `docker-compose.yml` file so it contains all microservices you need. The example content should be clear, but you can find more information in the [Docker Compose documentation](https://docs.docker.com/compose/). Don't remove the `identifier` and `db` container, they are respectively the entry-point and the database of your application. Don't forget to link the necessary microservices to the dispatcher and the database to the microservices.

### Configure the dispatcher

Next, alter the file `config/dispatcher.ex` based on the example that is there by default. Dispatch requests to the necessary microservices based on the names you used for the microservice.

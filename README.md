# README

## Table of Contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Using and testing](#using-and-testing)

## General info

The aim of this repository is to track week 4 challenge. 

## Technologies

The project was created with the following technologies:

* Ruby Version Manager (RVM): rvm 1.29.12
* Ruby Interpreter: ruby 3.1.0p0
* Bundle: Bundler 2.3.5
* Rails 6.1.4.4
* Rspec: rspec-rails  5.0.0

## Setup
To run this project you need to follow the following instructions:

### 1. Setting up the project and running it
1. Clone this repository in your localhost machine;
2. Navigate into the newly cloned repository;
3. Run bundle install to install the dependencies.

#### 1.1. Instructions:
```console
$ git clone https://github.com/feperessim/codeminer42-trainee-semana-4
$ cd codeminer42-trainee-semana-4/
$ bundle install

## Using and testing

#### 1.1. Instructions:

* 1. To play with the models directly

```console
foo@bar:~$ bin/rails db:migrate
foo@bar:~$ bin/rails console
foo@bar:~$ User.create(name:"Your name", age: 100, biography: A biography)
```

* 2. Running rspec 

```console
foo@bar:~$ bundle exec rspec
```
or

```console
foo@bar:~$ bundle rspec --format documentation
```

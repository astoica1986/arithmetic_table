# ArithmeticTable

This gem was done as part of a coding challenge.
The requirements were to implement a multiplication table in the terminal using the first N prime numbers.

However I made the app more extensible and added the ability to generate consecutive numbers (besides primes) and allow the use of any of four basic math operators: +, -, *, / . 

Note to reviewers : I did not plan this app with raw efficiency in mind. I am fully aware there are more efficient algorithms to generate the primes and that having distinct objects for generating a matrix and printing it adds a lot of time.
I wanted those classes to be as modular and reusable as possible.

## Installation

This is not meant to be uploaded to rubygems(although it can be)
To install it locally cd to gem directory and then

```ruby
bundle install

rake install
```

## Usage

Example
```ruby
 ~ arithmetic-table generate -s 9 --primes -o "/"   
```
Please run 
```ruby
 ~ arithmetic-table help generate   
```
for detailed instructions


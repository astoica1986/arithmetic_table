# ArithmeticTable

This gem was done as part of a coding challenge.
The requirements were to implement a multiplication table in the terminal using the first N prime numbers.

However I made the app more extensible and added the ability to generate consecutive numbers (besides primes) and allow the use of any of four basic math operators: +, -, *, / . 
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


require 'pry'

class Sieve

  def initialize max_prime
    @max_prime = max_prime

    # build the canditate list - start by assuming all numbers are prime:
    # i.e.: {2: :prime, 3: :prime, 4: :prime}
    @candidates = (2..max_prime).each_with_object(Hash.new(:prime)) { |num, hash| hash[num] = :prime }
  end

  # https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
  # use sieve algorthim -- more efficient than brute force and easy to code
  def primes
    return []     if max_prime < 2

    candidates.each do |prime,_|
      # skip numbers we already know NOT to be prime (from previous iterations)
      next        if candidates[prime] != :prime

      # find the prime number candidates greater than the current prime number
      candidates.select { |n,_| candidates[n].eql?(:prime) && n > prime }
                .each do |num,_|
                  # mark numbers evenly divisible by the current prime as NOT PRIME
                  @candidates[num] = :not_prime if (num % prime) == 0
                end
    end

    # convert numbers still marked as prime to an array of numbers
    candidates.map { |num,value| num if value.eql? :prime }.compact
  end

  private
  attr_reader :max_prime, :candidates

end

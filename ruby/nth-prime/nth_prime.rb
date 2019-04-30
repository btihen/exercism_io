require 'pry'

class Prime

  def self.nth nth_prime
    raise ArgumentError if nth_prime < 1 && !nth_prime.is_a?(Integer)

    max_prime = nth_prime * 15       # will assum 100 times more will be big enough
    primes = primes_up_to max_prime
    primes[nth_prime - 1]
  end

  private

  # https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
  # use sieve algorthim -- more efficient than brute force and easy to code
  def self.primes_up_to max_prime
    return []     if max_prime < 2

    candidates = (2..max_prime).each_with_object(Hash.new(:prime)) { |num, hash| hash[num] = :prime }

    candidates.each do |prime,_|
      # skip numbers we already know NOT to be prime (from previous iterations)
      next        if candidates[prime] != :prime

      # find the prime number candidates greater than the current prime number
      candidates.select { |n,_| candidates[n].eql?(:prime) && n > prime }
                .each do |num,_|
                  # mark numbers evenly divisible by the current prime as NOT PRIME
                  candidates[num] = :not_prime if (num % prime) == 0
                end
    end

    # convert numbers still marked as prime to an array of numbers
    candidates.map { |num,value| num if value.eql? :prime }.compact
  end

end

def prime_sum(limit)
    sieve = Array(Bool).new(limit+1, true)
    sieve[0] = false
    sieve[1] = false
    i=2
    while i*i < limit
        if sieve[i]
            j = i*i
            while j < limit
                sieve[j] = false
                j += i
            end
        end
        i += 1
    end
    total = 0_i64
    (2...limit).each do |k|
        total += k if sieve[k]
    end
    total
end

limit = 2_000_000
start_time = Time.monotonic
result = prime_sum(limit)
end_time = Time.monotonic
elapsed_time = end_time - start_time

puts "Sum of all primes below #{limit} is #{result}"
puts "Execution time: #{elapsed_time} seconds"
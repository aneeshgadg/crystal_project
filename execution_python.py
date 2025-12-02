import time
def prime_sum(limit):
    sieve = [True] * (limit + 1)
    sieve[0] = False
    sieve[1] = False
    i = 2
    while i * i < limit:
        if sieve[i]:
            j = i * i
            while j < limit:
                sieve[j] = False
                j += i
        i += 1
    total = 0
    for i in range(2,limit+1):
        if sieve[i]:
            total += i
    return total

if __name__ == "__main__":
    limit = 2000000
    start_time = time.perf_counter()
    result = prime_sum(limit)
    end_time = time.perf_counter()
    duration = end_time - start_time
    print(f"Sum of all primes below {limit} is {result}")
    print(f"Execution time: {duration:.4f} seconds")
mod timed_prime_test;

fn main() {
    for i in 0..=7 {
        timed_prime_test::search_for_primes(1000 * 10i64.pow(i), 3);
    }
}
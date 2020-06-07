#[path="./fast_prime.rs"]
mod fast_prime;

use std::time::{Instant};

pub fn search_for_primes(n: i64, count: i64) {
    if fast_prime::fast_is_prime(n, 2) {
        report(n);
        if count > 1 {
            search_for_primes(n + 1, count - 1);
        }
    } else {
        search_for_primes(n + 1, count);
    }
}

fn report(n: i64) {
    let start = Instant::now();
    fast_prime::fast_is_prime(n, 2);
    let duration = start.elapsed();

    println!("{} is prime, elapsed time is {:?}", n, duration);
}
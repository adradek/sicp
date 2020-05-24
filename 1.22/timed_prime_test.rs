#[path= "../1.21/smallest_divisor.rs"]
mod smallest_divisor;

use std::time::{Duration, Instant};

pub fn search_for_primes(n: i64, count: i64) {
    if is_prime(n) {
        report(n);
        if count > 1 {
            search_for_primes(n + 1, count - 1);
        }
    } else {
        search_for_primes(n + 1, count);
    }
}

fn is_prime(n: i64) -> bool {
    return n == smallest_divisor::calc(n);
}

fn report(n: i64) {
    let start = Instant::now();
    is_prime(n);
    let duration = start.elapsed();

    println!("{} is prime, elapsed time is {:?}", n, duration);
}

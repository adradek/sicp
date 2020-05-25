#[path="../1.21/smallest_divisor.rs"]
mod smallest_divisor;

use std::time::{Instant};

fn main() {
    let numbers: [i64; 12] = [
        10000019, 10000079, 10000103,
        100000007, 100000037, 100000039,
        1000000007, 1000000009, 1000000021,
        10000000019, 10000000033, 10000000061
    ];

    let mut start = Instant::now();
    let mut dur1 = start.elapsed();
    let mut dur2 = start.elapsed();

    for num in numbers.iter() {
        start = Instant::now();
        for _ in 0..100 {
            smallest_divisor::calc(*num);
        }
        dur1 = start.elapsed() / 100;

        start = Instant::now();
        for _ in 0..100 {
            better_smallest_divisor(*num);
        }
        dur2 = start.elapsed() / 100;

        println!("Prime {}: old took {:?}, new took {:?} ({} x faster)", num, dur1, dur2, dur1.as_secs_f64() / dur2.as_secs_f64());
    }
}

fn better_smallest_divisor(n: i64) -> i64 {
    return better_find_divisor(n, 2);
}

fn better_find_divisor(n: i64, div: i64) -> i64 {
    if div * div > n {
        return n;
    } else if n % div == 0 {
        return div;
    } else {
        return better_find_divisor(n, next_div(div));
    }
}

fn next_div(div: i64) -> i64 {
    if div == 2 {
        return 3;
    } else {
        return div + 2;
    }
}
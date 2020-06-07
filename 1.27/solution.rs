//! ```cargo
//! [dependencies]
//! rand = "0.7.3"
//! ```

extern crate rand;
use rand::Rng;

#[path="/home/alexey/sicp/1.24/fast_prime.rs"]
mod fast_prime;

fn main() {
    let carmichael_numbers: [i64; 6] = [ 561, 1105, 1729, 2465, 2821, 6601 ];
    
    for cn in carmichael_numbers.iter() {
        println!("Number {} passes the test: {}", cn, passes(*cn, 1));
    }
}

fn passes(num: i64, base: i64) -> bool {
    if num == base {
        true
    } else if fast_prime::expmod(base, num, num) != base {
        false
    } else {
        passes(num, base + 1)
    }
}
//! ```cargo
//! [dependencies]
//! rand = "0.7.3"
//! ```

extern crate rand;
use rand::Rng;

fn main() {
    let numbers: [i64; 9] = [
        561, 1105, 1729, 2465, 2821, 6601,
        10000019, 10000019, 10000103
    ];

    for n in numbers.iter() {
        println!("Number {} is prime: {}", n, prime_check(*n, 3));
    }
}

fn prime_check(n: i64, times: i32) -> bool {
    if times == 0 {
        true
    } else if miller_rabin(n) {
        prime_check(n, times - 1)
    } else {
        false
    }
}

fn miller_rabin(n: i64) -> bool {
    let mut rng = rand::thread_rng();
    let random_base: i64 = rng.gen_range(2, n - 1);

    let result = expmod_plus(random_base, n - 1, n);

    // println!("a: {}, n: {}, expmod_plus: {}", random_base, n, result);

    result == 1
}

fn expmod_plus(a: i64, exp: i64, n: i64) -> i64 {
    if exp == 0 {
        1
    } else if exp % 2 == 0 {
        let halved = expmod_plus(a, exp / 2, n);
        let res = halved.pow(2) % n;
        
        if res == 1 && halved != 1 && halved != n - 1 {
            // println!("Fake root found!");
            return 0;
        } else {
            res
        }
    } else {
        (a * expmod_plus(a, exp - 1, n)) % n
    }
}
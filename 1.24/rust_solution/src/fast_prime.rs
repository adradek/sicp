use rand::Rng;

pub fn fast_is_prime(n: i64, times: i32) -> bool {
    if times == 0 {
        true
    } else if fermat_test(n) {
        fast_is_prime(n, times - 1)
    } else {
        false
    }
}

fn fermat_test(n: i64) -> bool {
    let mut rng = rand::thread_rng();
    let random_base: i64 = rng.gen_range(1, n);
    random_base == expmod(random_base, n, n)
}

fn expmod(base: i64, exp: i64, m: i64) -> i64 {
    if exp == 0 {
        1
    } else if exp % 2 == 0 {
        expmod(base, exp / 2, m).pow(2) % m
    } else {
        (base * expmod(base, exp - 1, m)) % m
    }
}
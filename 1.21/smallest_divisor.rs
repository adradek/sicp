pub fn calc(n: i64) -> i64 {
    return find_divisor(n, 2);
}

fn find_divisor(n: i64, divisor: i64) -> i64 {
    if divisor * divisor > n {
        return n;
    } else if n % divisor == 0 {
        return divisor;
    } else {
        return find_divisor(n, divisor + 1);
    }
}
fn main() {
    let arr: [i64; 7] = [199, 1999, 19999, 32, 169, 773, 73*73];

    for n in arr.iter() {
        println!("The smallest divisor for {} is {}", n, smallest_divisor(*n));
    }
}

fn smallest_divisor(n: i64) -> i64 {
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
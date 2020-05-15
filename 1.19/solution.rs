fn main() {
    println!("Fibo 1 = {}", fib(1));
    println!("Fibo 2 = {}", fib(2));
    println!("Fibo 3 = {}", fib(3));
    println!("Fibo 4 = {}", fib(4));
    println!("Fibo 5 = {}", fib(5));
    println!("Fibo 13 = {}", fib(13));
    println!("Fibo 40 = {}", fib(40));
}

fn fib(n: u32) -> u64 {
    return fib_iter(1, 0, 0, 1, n);
}

fn fib_iter(a: u64, b: u64, p: u64, q: u64, count: u32) -> u64 {
    if count == 0 {
        return b;
    } else if count % 2 == 0 {
        return fib_iter(a, b, q * q + p * p, q * (q + 2 * p), count / 2);
    } else {
        return fib_iter((a + b) * q + a * p, a * q + b * p, p, q, count - 1);
    }
}
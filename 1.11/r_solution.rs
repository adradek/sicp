fn f(n: i32) -> i32 {
    if n < 3 {
        return n;
    } else {
        return f(n - 1) + f(n - 2) + f(n - 3);
    }
}

fn main() {
    for n in 1..11 {
        println!("f({}) => {}", n, f(n));
    }
}
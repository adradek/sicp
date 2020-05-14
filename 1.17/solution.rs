fn main() {
    println!("7 * 8 = {}", fast_product(7, 8));
    println!("7 * 9 = {}", fast_product(7, 9));
    println!("5 * 5 = {}", fast_product(5, 5));
    println!("6 * 4 = {}", fast_product(6, 4));
    println!("8 * 11 = {}", fast_product(8, 11));
    println!("9000 * 8000 = {}", fast_product(9000, 8000));
}

fn fast_product(a: u32, b: u32) -> u32 {
    if a == 0 || b == 0 {
        return 0;
    } else if b == 1 {
        return a;
    } else if b % 2 == 0 {
        return fast_product(double(a), halve(b));
    } else {
        return a + fast_product(a, b - 1);
    }
}

fn double(x: u32) -> u32 {
    return x + x;
}

fn halve(x: u32) -> u32 {
    return x / 2;
}
fn main() {
    println!("12 * 8 = {}", calc(12, 8));
    println!("9 * 6 = {}", calc(9, 6));
    println!("3 * 11 = {}", calc(3, 11));
    println!("16 * 16 = {}", calc(16, 16));
}

fn calc(a: u32, b: u32) -> u32 {
    return calc_iter(a, b, 0);
}

fn calc_iter(a: u32, b: u32, buf: u32) -> u32 {
    if a == 0 || b == 0 {
        return 0;
    } else if b == 1 {
        return a + buf;
    } else if b % 2 == 1 {
        return calc_iter(a, b - 1, buf + a);
    } else {
        return calc_iter(a * 2, b / 2, buf);
    }
}
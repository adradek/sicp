fn main() {
    println!("10^5 -> {}", pow(10, 5));
    println!("2^8 -> {}", pow(2, 8));
    println!("3^7 -> {}", pow(3, 7));
    println!("10^8 -> {}", pow(10, 8));
    println!("2^9 -> {}", pow(2, 9));
    println!("4^3 -> {}", pow(4, 3));
    println!("11^5 -> {}", pow(11, 5));
}

fn pow(number: u64, power: u32) -> u64 {
    return pow_iter(number, power, 1);
}

fn pow_iter(number: u64, power: u32, coef: u64) -> u64 {
    if power == 0 {
        println!("final iter!");
        return 1;
    } else if power == 1 {
        println!("final iter!");
        return number * coef;
    } else if power % 2 == 1 {
        println!("-1 iter");
        return pow_iter(number, power - 1, coef * number);
    } else {
        println!("/2 iter");
        return pow_iter(number * number, power / 2, coef);
    }
}
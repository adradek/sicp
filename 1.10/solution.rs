fn main() {
    println!("Akkerman 1 10 => {}", akkerman(1, 10));
    println!("Akkerman 2 4 => {}", akkerman(2, 4));
    println!("Akkerman 3 3 => {}", akkerman(3, 3));
}

fn akkerman(x: i32, y: i32) -> i32 {
    if y == 0 {
        return 0;
    } else if x == 0 {
        return 2 * y;
    } else if y == 1 {
        return 2;
    } else {
        return akkerman(x - 1, akkerman(x, y - 1));
    }
}
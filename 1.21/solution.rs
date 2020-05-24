mod smallest_divisor;

fn main() {
    let arr: [i64; 7] = [199, 1999, 19999, 32, 169, 773, 73*73];

    for n in arr.iter() {
        println!("The smallest divisor for {} is {}", n, smallest_divisor::calc(*n));
    }
}
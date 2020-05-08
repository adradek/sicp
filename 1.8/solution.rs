fn main() {
    println!("27 => {}", calc(27.0));
    println!("8 => {}", calc(8.0));
    println!("64 => {}", calc(64.0));
    println!("125 => {}", calc(125.0));
    println!("200 => {}", calc(200.0));
    println!("0.000001 => {}", calc(0.000001));
}

fn calc(number: f32) -> f32 {
    return iter_calc(number, 1.0);
}

fn iter_calc(number: f32, guess: f32) -> f32 {
    if good_enough(number, guess) {
        return guess;
    } else {
        return iter_calc(number, improve(number, guess));
    }
}

fn good_enough(number: f32, guess: f32) -> bool {
    return (number - guess * guess * guess).abs() < 0.00001 * number;
}

fn improve(number: f32, guess: f32) -> f32 {
    return (number / (guess * guess) + 2.0 * guess) / 3.0;
}
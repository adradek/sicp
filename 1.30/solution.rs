fn main() {
    let itself = |x: f64| -> f64 { x };
    let inc = |x: f64| -> f64 { x + 1.0 };

    println!("Sum 1..20: {}", sum(1.0, 20.0, &itself, &inc))
}

fn sum(a: f64, b: f64, term: &dyn Fn(f64) -> f64, nexta: &dyn Fn(f64) -> f64) -> f64 {
    sum_iter(a, b, term, nexta, 0.0)
}

fn sum_iter(a: f64, b: f64, term: &dyn Fn(f64) -> f64, nexta: &dyn Fn(f64) -> f64, s: f64) -> f64 {
    if a - b > (nexta(a) - a) * 0.3 {
        s
    } else {
        sum_iter(nexta(a), b, term, nexta, s + term(a))
    }
}
mod integrals;

fn main() {
    let step_array: [f64; 2] = [0.01, 0.001];
    let steps_array: [i32; 5] = [2, 10, 100, 200, 1000];
    let mut result: f64;

    println!("\n\nSimple:\n\n");
    
    for step in step_array.iter() {
        result = integrals::simple(0.0, 1.0, &cube, *step);
        println!("Simple Cube {}: {}, err: {}", step, result, (result - 0.25).abs());
    }

    println!("\n\nSimpson:\n\n");

    for steps in steps_array.iter() {
        result = integrals::simpson(0.0, 1.0, &cube, *steps);
        println!("Simpson Cube n={}: {}, err: {}", steps, result, (result - 0.25).abs());
    }
}

fn cube(x: f64) -> f64 {
    x * x * x
}
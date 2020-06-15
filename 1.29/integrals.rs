pub fn simple(a: f64, b: f64, f: &dyn Fn(f64) -> f64, dx: f64) -> f64 {
    let add_dx = |x: f64| -> f64 { x + dx };
    sum(a + dx / 2.0, b, f, &add_dx) * dx
}

pub fn simpson(a: f64, b: f64, f: &dyn Fn(f64) -> f64, n: i32) -> f64 {
    let h = (b - a) / (n as f64);
    let add_h = |x: f64| -> f64 { x + h };

    let simpson_member = |x: f64| -> f64 {
        let k: i32 = ((x - a) / h).round() as i32;
        let coef: f64;

        if k == 0 || k == n {
            coef = 1.0;
        } else if k % 2 == 0 {
            coef = 2.0;
        } else {
            coef = 4.0;
        }

        coef * f(x)
    };

    sum(a, b, &simpson_member, &add_h) * h / 3.0
}

fn sum(a: f64, b: f64, term: &dyn Fn(f64) -> f64, nexta: &dyn Fn(f64) -> f64) -> f64 {
    if a - b > (nexta(a) - a) * 0.3 {
        0f64
    } else {
        term(a) + sum(nexta(a), b, term, nexta)
    }
}



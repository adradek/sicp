fn f(n: i32) -> i32 {
    if n <= 3 {
        return n;
    } else {
        return f_iter(1, 2, 3, n - 4);
    }
}

fn f_iter(nx3: i32, nx2: i32, nx1: i32, cnt: i32) -> i32 {
    let nx0 = nx3 + nx2 + nx1;

    if cnt == 0 {
        return nx0;
    } else {
        return f_iter(nx2, nx1, nx0, cnt - 1);
    }
}

fn main() {
    for n in 1..=10 {
        println!("f({}) => {}", n, f(n));
    }
}
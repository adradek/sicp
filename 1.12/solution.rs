fn main() {
    for n in 1..=10 {
        println!("Degree: {}", n);
        calc(n);
        println!("================");
    }
}

fn calc(row: i32) {
    calc_iter(row, 1);
}

fn calc_iter(row: i32, cnt: i32) {
    if cnt > row {
        println!("{}", calc_elem(row, cnt));
    } else {
        print!("{} ", calc_elem(row, cnt));
        calc_iter(row, cnt + 1);
    }
}

fn calc_elem(row: i32, element: i32) -> i32 {
    if element < 1 || element > row + 1 {
        return 0;
    } else if row == 1 {
        return 1;
    } else {
        return calc_elem(row - 1, element - 1) + calc_elem(row - 1, element);
    }
}
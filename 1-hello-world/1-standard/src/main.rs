use std::time::Instant;

fn main() {
    let start = Instant::now();

    let mut array = create_array();
    order_array(&mut array);

    let duration = start.elapsed();
    println!("Execution time: {:?}", duration);
}

// Do a function here that creates an array of 100 elements and fills it with numbers between 0 and 100. Then, invert the array.
fn create_array() -> Vec<i32> {
    let mut array = Vec::new();
    for i in 0..100 {
        array.push(i);
    }
    array
}

fn order_array(array: &mut Vec<i32>) {
    array.reverse();
}
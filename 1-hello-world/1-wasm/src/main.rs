use std::time::Instant;
fn main() {
    let start = Instant::now();

    let mut array = create_array();
    order_array(&mut array);

    let duration = start.elapsed();
    println!("Execution time: {:?}", duration);
}


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
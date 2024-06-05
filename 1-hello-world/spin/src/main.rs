use std::time::Instant;

fn main() {
    let start = Instant::now();

    println!("Hello, world!");

    let duration = start.elapsed();
    println!("Execution time: {:?}", duration);
}

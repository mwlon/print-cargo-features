#!/bin/bash
set -eo pipefail

rustc --print target-features > raw_target_features.txt
python filter_target_features.py | sort -u > target_features.txt

mkdir -p src
echo "fn main() {" > src/main.rs
for x in $(cat ./target_features.txt); do
  echo "if cfg!(target_feature = \"$x\") { println!(\"+$x\"); } else { println!(\"-$x\"); }" >> src/main.rs
done
echo "}" >> src/main.rs
cargo run --release --quiet

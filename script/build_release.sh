#!/bin/bash

project="forward"

targets=(
  "x86_64-unknown-linux-gnu"
)

mkdir -p build

for target in "${targets[@]}"; do
  rustup target add "$target"
  cargo build --target="$target" --release
  cp target/"$target"/release/"$project" build/"$project"_"$target"
done

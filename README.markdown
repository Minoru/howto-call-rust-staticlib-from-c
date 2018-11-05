This repository is **DEPRECATED** in favour of [Alex Crichton's "Rust FFI
examples"](https://github.com/alexcrichton/rust-ffi-examples), which offers
worked code not just for C, but also C++, Haskell, Julia, Python, and more.

How to call a function defined in Rust static library from C
============================================================

I couldn't find ready examples of this, so I made my own. Key points:
- in your `Cargo.toml`, add `[lib]` section and set `crate-type` to
  `"staticlib"`;
- when linking, add `-lphtread -ldl`, which are required by Rust's static
  library but aren't linked into it by `rustc`.

Tested with Rust versions:
- 1.27.1, on July 15th, 2018;
- 1.28, on September 8th, 2018.

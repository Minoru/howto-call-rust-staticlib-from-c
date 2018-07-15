How to call a function defined in Rust static library from C
============================================================

I couldn't find ready examples of this, so I made my own. Key points:
- in your `Cargo.toml`, add `[lib]` section and set `crate-type` to
  `"staticlib"`;
- when linking, add `-lrustlib -lphtread -ldl`, which are required by Rust's
  static library but aren't linked into it by `rustc`.

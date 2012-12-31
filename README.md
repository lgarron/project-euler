# Project Euler

Lucas Garron

Redoing Project Euler over 7 years later.  
https://projecteuler.net/problems

## Notes

- Primary languages:
  - Haskell (for concise solutions)
  - Mathematica (for fast math)
  - C (for fast code)

### Coding Style

- Comments at the top: problem number, name, date, sometimes runtime.
- Preferably a self-contained, runnable file.
- Use standard libraries or custom code.
- Print *only* the integer result. Send (minimal) debug/progress output to `stderr`.

### Specific Languages

- Mathematica
  - Calculate an integer, set `result` to it, `Print[result]`.
  - When defining functions, include types like `_Integer` and `_List` for type safety.
- Haskell:
  - Include imports, and only import specific functions.
  - Annotate every free-standing function/expression with a type, as well as any appropriate where clauses.
  - Code section that ends with the calculation of `result :: Integer`.
  - Output section using `main = print result`.
  - If the problem has input: `main = readFile "filename.txt" >>= print . result`.
    - This makes `result` a function, but it's still pure.
    - `result` should probably use an auxiliary `parseInput` function in a `where` clause.
  - Memoization: use Data.MemoCombinators unless a list is obviously appropriate.
- C
  - Use static data structures with initalization methods.
  - Have an `int result()` function, only print the result in main.
  - Free all malloced data.

The idea behind having a consistent variable/function `result` is that the code files could be imported/compiled/linked dynamically in the future. (Not sure how to deal with the two possible types for `result` in Haskell, yet.)

## Disclaimer

I'm putting these up on the internet for a few reasons.  
For example, it's a way to encourage me to work on my coding style by publishing clean code.  
If you're interested in the idioms, decomposition, data structures, and optimizations I use, please feel free to peruse my solutions, but keep in mind that if you're planning to solve these yourself, it's more valuable to do it by yourself first, and *then* see what others have done.
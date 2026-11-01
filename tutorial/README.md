# Reasoning tutorial

The C++ tutorial verifies an infinite-time safety property for a simple
one-dimensional contraction, `x' = 0.375 - x`. Starting from
`0.3125 <= x <= 0.34375`, it uses `verify_safety` to prove that all
reachable states remain in `-2 <= x <= 2`. The attracting equilibrium
lies inside a grid cell, allowing the chain-reachability computation to
stabilise quickly.

The program checks the safety certificate and fails if safety cannot be
proved (an indeterminate result is not a proof of unsafety). Unlike a
finite-time `upper_reach` computation, this demonstrates a safety
verification procedure rather than just generating a reachable set.

After installing the library, configure the standalone tutorial:

```bash
cmake -S tutorial -B tutorial/build -DCMAKE_PREFIX_PATH="$PWD/install"
cmake --build tutorial/build --parallel
./tutorial/build/tutorial_reasoning
```

The Python tutorial shows the registered Reasoning classes in the composed
`pyariadne` module:

```bash
python tutorial/tutorial_reasoning.py
```

Unlike the C++ program, the Python example currently checks bindings rather
than performing safety verification; full computational parity is not yet
verified.

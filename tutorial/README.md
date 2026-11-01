# Reasoning tutorial

The C++ tutorial constructs a contracting vector field, computes a short
validated upper reachable set, and checks that the result is nonempty. This
demonstrates the distinction between Evolution (orbit enclosures) and
Reasoning (grid-backed reachability).

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
than computing a reachable set; full computational parity is not yet verified.

#!/usr/bin/env python3
"""Exercise the Reasoning types registered in the composed pyariadne module."""

from pyariadne import (
    Storage, LabelledStorage, HybridStorage,
    ContinuousReachabilityAnalyser, ReachabilityAnalyserConfiguration,
    SafetyCertificate,
)

def main():
    # Instantiation of a full analyser requires a configured evolver and
    # symbolic initial/safe sets; the C++ tutorial shows that computation.
    interfaces = (Storage, LabelledStorage, HybridStorage,
                  ContinuousReachabilityAnalyser,
                  ReachabilityAnalyserConfiguration, SafetyCertificate)
    for interface in interfaces:
        assert interface.__name__
        print(interface.__name__)

if __name__ == "__main__":
    main()

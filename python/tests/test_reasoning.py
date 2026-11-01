"""Check Reasoning bindings in the composed Python module."""
import pyariadne as a

def test_reasoning_bindings():
    for name in ("SatSolver", "SmtSolver", "Storage", "LabelledStorage", "HybridStorage",
                 "ContinuousReachabilityAnalyser", "SafetyCertificate",
                 "ReachabilityAnalyserConfiguration"):
        assert hasattr(a, name), name

if __name__ == "__main__":
    test_reasoning_bindings()

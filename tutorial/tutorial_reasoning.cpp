#include <iostream>
#include <stdexcept>
#include "ariadne-reasoning.hpp"
#include "integration/integrator.hpp"

using namespace Ariadne;
int main() {
    RealVariable x("x");
    List<DottedRealAssignment> dynamics;
    dynamics.append(dot(x)=-x);
    VectorField field(dynamics);
    TaylorPicardIntegrator integrator(StepMaximumError(1e-5));
    VectorFieldEvolver evolver(field,integrator);
    evolver.configuration().set_maximum_step_size(0.05);
    evolver.configuration().set_maximum_enclosure_radius(1.0);
    ContinuousReachabilityAnalyser analyser(evolver);
    analyser.configuration().set_maximum_grid_fineness(2);
    RealExpressionBoundedConstraintSet initial({0.875_dec<=x<=1.125_dec});
    auto state=initial.euclidean_set(field.state_space());
    auto reached=analyser.upper_reach(state,Real(0.05_dec));
    if (reached.size()==0u) throw std::runtime_error("Empty upper reachable set");
    std::cout << "Upper reachable cells: " << reached.size() << "\n";
    return 0;
}

include(CTest)
set(UNIT_TESTS
    test_hybrid_reachability
    test_storage_orbit_header
    test_storage_header
    test_enclosure_storage_header
    test_finite_time_reachability
    test_infinite_time_reachability
    test_verify_safety
)
foreach(TEST IN LISTS UNIT_TESTS)
    add_executable(${TEST} ${TEST}.cpp)
    target_link_libraries(${TEST} ariadne-reasoning reasoning)
    add_test(NAME ${TEST} COMMAND $<TARGET_FILE:${TEST}>)
    set_property(TEST ${TEST} PROPERTY LABELS "reasoning")
endforeach()
add_custom_target(tests)
add_dependencies(tests ${UNIT_TESTS})

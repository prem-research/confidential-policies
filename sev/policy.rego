package sev

default allow := false

allow if {
    check_guest_policy(input.policy)
    # input.vmpl == 0
}

check_guest_policy(policy) if {
    policy.debug_allowed == false
}

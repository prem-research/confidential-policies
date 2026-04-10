package sev

default allow := false

allow if {
    check_guest_policy(input.policy)
    check_guest_tcb(input.current_tcb)
    # input.vmpl == 0
}

check_guest_tcb(policy) if {
    policy.microcode >= 72
}

check_guest_policy(policy) if {
    policy.debug_allowed == false
}

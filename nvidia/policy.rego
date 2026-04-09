package nvidia

import future.keywords.every
default allow := false

allow if {
	# attestation with no gpu claims? no can do
	count(input.gpu_claims) > 0

    # validate overall claims
    validate_overall(input.overall_claims)

    # validate every gpu claim independently
    # every key, val in input.gpu_claims {
    #     validate_claim_by_device_type(val)
    # }
}

validate_overall(overall) if {
	overall["x-nvidia-overall-att-result"] == true
}

# validate_claim_by_device_type(claim) if {
#     claim["x-nvidia-device-type"] == "gpu"
#     validate_gpu_claims(claim)
# }

# # validate_claim_by_device_type(claim) if {
# #     claim["x-nvidia-device-type"] == "nvswitch"
# #     validate_switch_claims(claim)
# # }

# validate_gpu_claims(claims) if {
#     check_measurements_match(claims)
#     check_gpu_ar_cert_chain(claims)
#     check_gpu_driver_rim_cert_chain(claims)
#     check_gpu_vbios_rim_cert_chain(claims)
# }

# validate_switch_claims(claims) if {
#     check_measurements_match(claims)
#     check_switch_ar_cert_chain(claims)
#     check_switch_bios_rim_cert_chain(claims)
# }

# check_measurements_match(claims) if {
#     claims.measres == "success"
# }

# check_gpu_ar_cert_chain(claims) if {
#     cert_chain := claims["x-nvidia-gpu-attestation-report-cert-chain"]
#     cert_chain["x-nvidia-cert-status"] == "valid"
#     cert_chain["x-nvidia-cert-ocsp-status"] == "good"
#     cert_chain["x-nvidia-cert-ocsp-nonce-matches"] == true
#     cert_chain["x-nvidia-cert-ocsp-response-valid"] == true
# }

# check_gpu_driver_rim_cert_chain(claims) if {
#     cert_chain := claims["x-nvidia-gpu-driver-rim-cert-chain"]
#     cert_chain["x-nvidia-cert-status"] == "valid"
#     cert_chain["x-nvidia-cert-ocsp-status"] == "good"
#     cert_chain["x-nvidia-cert-ocsp-nonce-matches"] == true
#     cert_chain["x-nvidia-cert-ocsp-response-valid"] == true
# }

# check_gpu_vbios_rim_cert_chain(claims) if {
#     cert_chain := claims["x-nvidia-gpu-vbios-rim-cert-chain"]
#     cert_chain["x-nvidia-cert-status"] == "valid"
#     cert_chain["x-nvidia-cert-ocsp-status"] == "good"
#     cert_chain["x-nvidia-cert-ocsp-nonce-matches"] == true
#     cert_chain["x-nvidia-cert-ocsp-response-valid"] == true
# }

# check_switch_ar_cert_chain(claims) if {
#     cert_chain := claims["x-nvidia-switch-attestation-report-cert-chain"]
#     cert_chain["x-nvidia-cert-status"] == "valid"
#     cert_chain["x-nvidia-cert-ocsp-status"] == "good"
#     cert_chain["x-nvidia-cert-ocsp-nonce-matches"] == true
#     cert_chain["x-nvidia-cert-ocsp-response-valid"] == true
# }

# check_switch_bios_rim_cert_chain(claims) if {
#     cert_chain := claims["x-nvidia-switch-bios-rim-cert-chain"]
#     cert_chain["x-nvidia-cert-status"] == "valid"
#     cert_chain["x-nvidia-cert-ocsp-status"] == "good"
#     cert_chain["x-nvidia-cert-ocsp-nonce-matches"] == true
#     cert_chain["x-nvidia-cert-ocsp-response-valid"] == true
# }

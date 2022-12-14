%lang starknet
%builtins pedersen range_check ecdsa

from starkware.cairo.common.cairo_builtins import HashBuiltin, SignatureBuiltin
from starkware.cairo.common.uint256 import Uint256
from starkware.starknet.common.syscalls import (get_caller_address, get_contract_address)
from starkware.cairo.common.bool import TRUE, FALSE


########################
#        Structs
########################

struct Event:
    member id: felt
    member address_owner: felt

    member ipfs_hash: felt # retrieves data on IPFS

    member timestamp_starts_at: Uint256
    member timestamp_ends_at: Uint256
    
    member max_capacity: Uint256
    member total_deposits: Uint256

    member nb_confirmed_rsvps: Uint256
    member nb_claimed_rsvps: Uint256

    member is_paid_out: felt # boolean
end


########################
#       Mappings
########################

@storage_var
func id_to_event(id: felt) -> (event: Event):
end

@storage_var
func user_confirmations_for_event(id_event: felt, address_user: felt) -> (is_confirmed: felt):
end

@storage_var
func user_claims_for_event(id_event: felt, address_user: felt) -> (is_claimed: felt):
end


########################
#        Events
########################

@event
func event_created(
    id_event: felt,
    address_owner: felt
):
end

@event
func rsvp_submitted(
    id_event: felt,
    address_attendee: felt
):
end

@event
func attendee_confirmed(
    id_event: felt,
    address_attendee: felt
):
end

@event
func deposits_paid_out(
    id_event: felt
):
end


########################
#      Constructor
########################

@constructor
func constructor{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
):
    return ()
end


########################
#  Contract functions
########################

@external
func create_new_event{}(
    starts_at: felt,
    ends_at: felt,
    max_capacity: felt
):
    return ()
end

@external
func rsvp_to_event{}(id_event: felt):
    return ()
end

@external
func confirm_attendee{}(id_event: felt, address_attendee: felt):
    return ()
end

@external
func confirm_all_attendees{}(id_event: felt):
    return ()
end

@external
func withdraw_unclaimed_deposits{}(id_event: felt):
    return ()
end

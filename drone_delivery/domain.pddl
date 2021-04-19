(define (domain drone_delivery)

  (:requirements
    :typing
    :negative-preconditions
  )

  (:types
    location
    package
  )

  (:predicates
    (robot_at ?l - location)
    (pkg_at ?pkg - package ?l - location)
    (package_is_loaded ?pkg - package)
    (robot_is_full)
    (flying)
    (ok_preflight_check)
    (ok_secure_cargo)
  )

  ; OK
  (:action move
    :parameters (?source ?destination - location)
    :precondition (and (robot_at ?source)
                       (flying)
                       (ok_preflight_check)
    )
    :effect (and (not (robot_at ?source))
                 (robot_at ?destination)
    )
  )

  ; OK
  (:action load
    :parameters (?pkg - package ?pkg_location - location)
    :precondition (and (robot_at ?pkg_location)
                       (pkg_at ?pkg ?pkg_location)
                       (not (package_is_loaded ?pkg))
                       (not (robot_is_full))
                       (not (flying))
    )
    :effect (and (not (pkg_at ?pkg ?pkg_location))
                 (package_is_loaded ?pkg)
                 (robot_is_full)
                 (not (ok_secure_cargo))
                 (not (ok_preflight_check))
    )
  )
  
  ; OK
  (:action unload
    :parameters (?pkg - package ?pkg_location - location)
    :precondition (and (robot_at ?pkg_location)
                       (not (pkg_at ?pkg ?pkg_location))
                       (package_is_loaded ?pkg)
                       (robot_is_full)
                       (not (flying))
    )
    :effect (and (pkg_at ?pkg ?pkg_location)
                 (not (package_is_loaded ?pkg))
                 (not (robot_is_full))
                 (not (ok_preflight_check))
                 (not (ok_secure_cargo))
    )
  )

  ; OK
  (:action take-off
    :parameters ()
    :precondition (and (not (flying))
                       (ok_preflight_check)
                       (or (not (robot_is_full))
                           (and (robot_is_full)
                                (ok_secure_cargo)
                           )
                       )
    )
    :effect (and (flying))
  )

  ; OK
  (:action landing
    :parameters ()
    :precondition (and (flying))
    :effect (and (not (flying))
                 (not (ok_preflight_check))
    )
  )

  ; OK
  (:action preflight_check
    :parameters ()
    :precondition (and (not (flying))
                       (or (not (robot_is_full))
                           (and (robot_is_full)
                                (ok_secure_cargo)
                           )
                       )
    )
    :effect (and (ok_preflight_check))
  )

  ; OK
  (:action secure_cargo
    :parameters ()
    :precondition (and (robot_is_full)
                       (not (flying))
    )
    :effect (and (ok_secure_cargo)
    )
  )
)

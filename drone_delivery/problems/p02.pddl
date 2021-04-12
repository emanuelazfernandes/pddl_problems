(define (problem p01)

  (:domain drone_delivery)

  (:objects
    locA locB - location
    pkg1 pkg2 - package
  )

  (:init 
    (robot_at locA)
    (pkg_at pkg1 locB)
    (not (flying))
    (not (ok_preflight_check))
    (not (robot_is_full))
  ) 

  (:goal
    (and (pkg_at pkg1 locA)
    )
  )
)

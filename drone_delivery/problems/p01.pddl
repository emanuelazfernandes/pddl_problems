(define (problem p01)

  (:domain drone_delivery)

  (:objects
    Porto Lisboa - location
    pkg1 pkg2 - package
  )

  (:init 
    (robot_at Porto)
    (pkg_at pkg1 Lisboa)
    (pkg_at pkg2 Lisboa)
  )

  (:goal
    (and (pkg_at pkg1 Porto)
         (pkg_at pkg2 Porto)
    )
  )
)

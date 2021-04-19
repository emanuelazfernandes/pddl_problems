(define (problem p01)

  (:domain drone_delivery)

  (:objects
    ;Porto Bragança Coimbra Guarda Lisboa Evora Lagos Faro - location
    Porto Lisboa Faro - location
    pkg1 pkg2 pkg3 - package
  )

  (:init
    (robot_at Porto)
    (pkg_at pkg1 Porto)
    (pkg_at pkg2 Porto)
    (pkg_at pkg3 Faro)
  )

  (:goal
    (and (pkg_at pkg1 Lisboa)
         ;(pkg_at pkg2 Lisboa)
         ;(pkg_at pkg3 Lisboa)
    )
  )
)

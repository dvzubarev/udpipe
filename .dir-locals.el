((nil . ((eval . (progn (setq-local projectile-project-test-cmd #'helm-ctest)
                        (setq-local projectile-project-compilation-dir "src/")
                        (setq-local helm-make-build-dir (projectile-compilation-dir))
                        (setq-local helm-ctest-dir (projectile-compilation-dir))
                        (setq-local cmake-meta-build-dir (projectile-compilation-dir))
                        (setq-local ccls-initialization-options  `(:cache (:directory ,(concat (getenv "HOME") "/.cache/ccls"))))
                        ))
         (projectile-project-name . "udpipe")
         )))

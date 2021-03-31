(in-package :mu-cl-resources)

;;;;
;; NOTE
;; docker-compose stop; docker-compose rm; docker-compose up
;; after altering this file.

;;;;
;; Describe the prefixes which you'll use in the domain file here.
;; This is a short-form which allows you to write, for example,
;; (s-url "http://purl.org/dc/terms/title")
;; as (s-prefix "dct:title")

(add-prefix "rdf" "http://www.w3.org/1999/02/22-rdf-syntax-ns#")
(add-prefix "foaf" "http://xmlns.com/foaf/0.1/")
(add-prefix "mu" "http://mu.semte.ch/vocabularies/core/")
(add-prefix "account" "http://mu.semte.ch/vocabularies/account/")
(add-prefix "dct" "http://purl.org/dc/terms/")
(add-prefix "ext" "http://mu.semte.ch/vocabularies/ext/")
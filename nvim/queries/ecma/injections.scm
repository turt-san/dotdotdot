; extends

((comment) @_comment
  (#match? @_comment "^/\\*\\s*sql\\s*\\*/$")
  .
  (template_string) @injection.content
  (#set! injection.language "sql")
  (#set! injection.include-children))

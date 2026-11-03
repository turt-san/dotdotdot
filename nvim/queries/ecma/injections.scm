; extends

((comment) @_comment
  (#match? @_comment "^/\\*\\s*sql\\s*\\*/$")
  .
  (template_string (string_fragment) @injection.content)
  (#set! injection.language "sql"))

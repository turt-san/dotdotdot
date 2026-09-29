Lowering the semantic token priority can help when there is infighting between TreeSitter and the LSP
-# The default is: LSP = 125, TreeSitter = 100

```vim
:lua vim.highlight.priorities.semantic_tokens = 95
```

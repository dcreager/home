(autoload 'protobuf-mode "protobuf-mode"
  "Major mode for editing Protocol Buffer files." t)
(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))

# Hands-on Introduction to PyTorch

Get the latest PDF: https://github.com/chiroptical/pytorch-introduction/releases/latest

##### Notes

- To make a new release,

```
git tag -a v0.1a0 -m "Release v0.1a0"
git push origin v0.1a0
# Update default.nix to point to the new release when it builds
nix-build # build the project, need to update sha256
nix-store --query --references $(nix-instantiate shell.nix) \
  | xargs nix-store --realise \
  | xargs nix-store --query --requisites \
  | cachix push chiroptical # cache the shell environment
git commit -am "Release v0.1a0"
git push
```

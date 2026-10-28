```bash
systemctl --user enable --now ssh-agent.service
```

```sshconfig
Host github.com
    IdentityFile ~/.ssh/keys/github-new
    AddKeysToAgent yes
```

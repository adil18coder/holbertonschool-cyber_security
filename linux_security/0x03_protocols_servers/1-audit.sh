#!/bin/bash
grep -E 'KbdInteractiveAuthentication|UsePAM|X11Forwarding|PrintMotd|AcceptEnv|PasswordAuthentication|PermitRootLogin' /etc/ssh/sshd_config

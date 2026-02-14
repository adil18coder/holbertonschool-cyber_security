#!/bin/bash
grep -Ev 'KbdInteractiveAuthentication|UsePAM|X11Forwarding|PrintMotd|AcceptEnv|PasswordAuthentication|PermitRootLogin' /etc/ssh/sshd_config

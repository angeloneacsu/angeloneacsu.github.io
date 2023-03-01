---
title: How to update Squid Proxy for working from home
date: 2023-02-1 18:9:00
#icon: fas fa-info-circle
categories: [firewall,squid,linux]
tags: [ufw,squid,linux]
published: true
---

# How to update Squid Proxy for working from home

- Find your home external IP address:
```
curl ifconfig.me
86.121.11.100
```

- Edit /etc/squid/squid.conf and add your home external IP
```
acl angelo src 86.121.11.100/32
```

# Restart
```
systemctl restart squid
```

# Permit FW access
```
ufw allow from 86.121.11.100/32 to any port 3269
ufw status
```

---
title: How to use Docker with UFW firewall on DigitalOcean droplet
date: 2022-09-13 15:49:00
#icon: fas fa-info-circle
categories: [firewall,docker,linux]
tags: [ufw,docker,linux]
published: true
---

# How to use Docker with UFW firewall on DigitalOcean droplet

- Default setup
```
ufw disable
ufw enable
ufw status
ufw default deny incoming
ufw default allow outgoing
```

- Fix docker with UFW
```
wget -O ./ufw-docker https://github.com/chaifeng/ufw-docker/raw/master/ufw-docker
chmod 755 ./ufw-docker
./ufw-docker install # This will alter /etc/ufw/after.rules
```

- Now permit your exposed traffic
```
ufw allow ssh
ufw allow 443/tcp
ufw route allow proto tcp to any port 443
```

- Check logs
```
ufw status
tail -f /var/log/ufw.log 
```

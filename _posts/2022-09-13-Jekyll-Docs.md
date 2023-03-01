---
title: How to deploy this documentation site
date: 2022-09-13 15:49:00
#icon: fas fa-info-circle
categories: [docs,docker]
tags: [jekyll,docker,linux]
published: true
---

# How to deploy this documentation site

- Edit files in `_posts` folder: `~/work/personale/angeloneacsu.github.io/_posts`

- Run the following: `JEKYLL_ENV=production bundle exec jekyll build`

- Archive folder and send it to vm1.sysbox.pro:

```
tar zcf _site.tgz _site/
scp _site.tgz root@vm1.sysbox.pro:/opt/docs/
ssh -l root vm1.sysbox.pro  'tar xf /opt/docs/_site.tgz -C /opt/docs/'
ssh -l root vm1.sysbox.pro  'docker-compose -f /opt/docs/docs.yaml up -d'
```

---
title: How to deploy this documentation site
date: 2022-09-13 15:49:00
#icon: fas fa-info-circle
categories: [docs,docker]
tags: [jekyll,docker,linux]
published: true
---

# How to deploy this documentation site

- Clone repo: 
```
git clone github.com:angeloneacsu/angeloneacsu.github.io.git
cd angeloneacsu.github.io
```

- Edit files in `_posts` folder: `~/work/personale/angeloneacsu.github.io/_posts`

- Run the following:
```
./deploy.sh
```

- deploy.sh file

```
JEKYLL_ENV=production bundle exec jekyll build
tar zcf _site.tgz _site/;
scp _site.tgz root@vm1.sysbox.pro:/opt/docs/
ssh -l root vm1.sysbox.pro 'tar xf /opt/docs/_site.tgz -C /opt/docs/'
ssh -l root vm1.sysbox.pro 'docker-compose -f /opt/docs/docs.yaml up -d'
rm -f _site.tgz
```

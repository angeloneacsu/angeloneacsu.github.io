JEKYLL_ENV=production bundle exec jekyll build
tar zcf _site.tgz _site/;
scp _site.tgz root@vm1.sysbox.pro:/opt/docs/
ssh -l root vm1.sysbox.pro 'tar xf /opt/docs/_site.tgz -C /opt/docs/'
ssh -l root vm1.sysbox.pro 'docker-compose -f /opt/docs/docs.yaml up -d'
rm -f _site.tgz

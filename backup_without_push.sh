filename="backup_new_"`eval date +%Y-%m-%d"_"%H-%M`".tgz"
#tar -czvf ../backup.tar.gz .
#bundle exec rake assets:precompile
git add .
git add -u
git commit -m "last commit"
tar -czf ../alexblog-backup/$filename .
echo "#################################################"
echo "###        SUCCESSFULLY    ARCHIVED          ####"
echo "#################################################"

#!/bin/bash
if [ "$#" -ne 1 ]
then
  echo "Must supply tree name"
  exit 1
fi
if [ ! -d $1 ]
then
    echo "Directory does not exist"
    exit 2
fi

cd $1/mail

for D in *; do
    chown $D $D
    chmod -R go-rwx $D
done

cd ../bin
chown root:root mail-in
chown root:root mail-out
chmod -v u+s mail-out
chmod -v u+s mail-in
chmod go-rwx mail-out

cd ..
chmod 555 bin/ 
chmod 555 tmp/
chmod 555 mail/
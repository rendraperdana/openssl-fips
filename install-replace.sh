!#/bin/bash

cd ./openssl-fips-2.0.16
make clean
./config fips no-ec2m no-ssl2 no-ssl3 no-weak-ssl-ciphers -O3 -Ofast -march=native
make depend -j$(grep -c ^processor /proc/cpuinfo)
make -j$(grep -c ^processor /proc/cpuinfo)
make install

cd ../
ln -s ./openssl-fips-2.0.16/fips fips

make clean
./config fips no-ec2m no-ssl2 no-ssl3 no-weak-ssl-ciphers -O3 -Ofast -march=native --prefix=/usr --openssldir=/usr shared
make depend -j$(grep -c ^processor /proc/cpuinfo)
make -j$(grep -c ^processor /proc/cpuinfo)
make install

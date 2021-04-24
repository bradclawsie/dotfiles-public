wget https://download.savannah.gnu.org/releases/guile-json/guile-json-4.5.2.tar.gz
tar -xzf guile-json-4.5.2.tar.gz
cd guile-json-4.5.2
./configure --prefix=$HOME/guile --libdir=$HOME/guile/lib
make install
cd ..
rm -rf guile-json*

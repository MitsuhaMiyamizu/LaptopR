call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86_amd64
cp -r 'C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2020.3.279\windows\mkl\tools\builder\' 'C:\projects\laptopr\'
cp Rlapack_list.txt .\builder\
cp Rblas_list.txt .\builder\
cp 'C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2020.3.279\windows\redist\intel64\compiler\libiomp5md.dll' 'C:\projects\laptopr\builder\'
cd .\builder\
nmake libintel64 MKLROOT="C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2020.3.279\windows\mkl" export=Rblas_list.txt name=Rblas 
nmake libintel64 MKLROOT="C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2020.3.279\windows\mkl" export=Rlapack_list.txt name=Rlapack
dumpbin /dependents .\builder\Rlapack.dll

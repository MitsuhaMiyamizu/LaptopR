call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
dumpbin /exports Rblas.dll /out:Rblas_list.txt
dumpbin /exports Rlapack.dll > Rlapack_list_R.txt

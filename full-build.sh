#!/usr/bin/env bash
cd "$(dirname "$0")"

# Cleanup
rm -rf src pkg

# Update system
pacman -Syyu --noconfirm
#pacman -S --needed --noconfirm mingw-w64-{i686,x86_64}-{gcc,gcc-fortran}
pacman -S --needed --noconfirm mingw-w64-{i686,x86_64}-{icu,libtiff,libjpeg,libpng,pcre2,xz,bzip2,zlib}
pacman -S --needed --noconfirm mingw-w64-{i686,x86_64}-{cairo,tk,curl}
export _intel_arch=intel64
export _intel_lib=mkl_intel_lp64
#export MKL="-L${MKLROOT}/lib/intel64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -lmkl_rt -lpthread -lm -ldl"
#export _intel_cc_opt="-O3 -fPIC -m64 -march=native -fp-model precise -fp-model source -I${MKLROOT}/include"
#export LDFLAGS="-qopenmp"
#export CFLAGS="${_intel_cc_opt}"
#export CXXFLAGS="${_intel_cc_opt}"
#export FFLAGS="${_intel_cc_opt}"
#export FCFLAGS="${_intel_cc_opt}"
export CC="icc"
export CXX="icpc"
export F77="ifort"
export FC="ifort"
export AR="xiar"
export LD="xild"

# Build package (only once)
set -o pipefail
MINGW_INSTALLS="mingw64" makepkg-mingw 2>&1 | tee r-devel.log

# Copy installer to root directory
cp -f src/R-source/src/gnuwin32/installer/*.exe .

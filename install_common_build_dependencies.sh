# These are typical packages needed for our builds.
# Depending on your needs you can skip installing them...



PACKAGES_RPM="
     SDL-devel
     autoconf-
     automake
     boost
     chrpath
     cmake
     dbus-c++-devel
     dbus-devel
     diffstat
     docbook-xsl
     expat-devel
     fuse-devel
     gawk
     gcc
     gcc-c++
     git
     intltool
     libtool
     make
     maven
     pkgconfig
     python
     socat
     systemd-devel
     texinfo
     unzip
     wget
     xterm
"

PACKAGES_DEB="
     automake
     autotools-dev
     build-essential
     chrpath
     cmake
     diffstat
     docbook-xsl
     g++
     gawk
     gcc
     gcc-multilib
     git
     intltool
     libboost-dev
     libdbus-1-dev
     libdbus-c++-dev
     libexpat1-dev
     libfuse-dev
     libsdl1.2-dev
     libsystemd-daemon-dev
     libtool
     make
     maven
     pkg-config
     python
     socat
     texinfo
     unzip
     wget
     xterm
"

installer=
[ -x "$(which apt-get 2>/dev/null)" ] && installer=apt-get
[ -x "$(which yum 2>/dev/null)" ] && installer=yum
[ -x "$(which dnf 2>/dev/null)" ] && installer=dnf
[ -e /etc/debian-release ] && installer=apt-get

case $installer in
   apt-get)
      sudo $installer update
      sudo $installer install -y $PACKAGES_DEB
      ;;
   dnf|yum)
      sudo $installer install -y $PACKAGES_RPM
      ;;
   *)
      echo "Unsupported package type - fix script"
      exit 1
      ;;
esac



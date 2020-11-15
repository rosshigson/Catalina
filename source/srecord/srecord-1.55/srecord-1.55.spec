#
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#
#    W   W    A    RRRR   N   N   III  N   N  III  N   N   GGG
#    W   W   A A   R   R  NN  N    I   NN  N   I   NN  N  G   G
#    W   W  A   A  RRRR   N N N    I   N N N   I   N N N  G
#    W W W  AAAAA  R R    N  NN    I   N  NN   I   N  NN  G  GG
#    W W W  A   A  R  R   N   N    I   N   N   I   N   N  G   G
#     W W   A   A  R   R  N   N   III  N   N  III  N   N   GGG
#
# Warning: DO NOT send patches which fix this file.  IT IS NOT
# the original source file.  This file is GENERATED from the
# Aegis repository file manifest.  If you find a bug in this
# file, it could well be an Aegis bug.
#
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#
Summary: srecord
Name: srecord
Version: 1.55.D001
Release: 1
License: GPL
Group: Development/Tools
Source: http://srecord.sourceforge.net/%{name}-%{version}.tar.gz
URL: http://srecord.sourceforge.net/
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildRequires: boost-devel
BuildRequires: diffutils
BuildRequires: groff
BuildRequires: libgcrypt-devel
BuildRequires: libtool
BuildRequires: sharutils

%description
A collection of powerful tools for manipulating EPROM load files


%prep
%setup -q


%build
%configure
make


%install
rm -rf $RPM_BUILD_ROOT
make DESTDIR=$RPM_BUILD_ROOT install


%check || :
make sure


%clean
rm -rf $RPM_BUILD_ROOT


%files
%defattr (-,root,root,-)
%doc LICENSE BUILDING README
%{_bindir}/srec_cat
%{_bindir}/srec_cmp
%{_bindir}/srec_info
%{_mandir}/man1/srec_cat.1
%{_mandir}/man1/srec_cmp.1
%{_mandir}/man1/srec_examples.1
%{_mandir}/man1/srec_info.1
%{_mandir}/man1/srec_input.1
%{_mandir}/man1/srec_license.1
%{_mandir}/man5/srec_aomf.5
%{_mandir}/man5/srec_ascii_hex.5
%{_mandir}/man5/srec_atmel_generic.5
%{_mandir}/man5/srec_binary.5
%{_mandir}/man5/srec_brecord.5
%{_mandir}/man5/srec_cosmac.5
%{_mandir}/man5/srec_dec_binary.5
%{_mandir}/man5/srec_emon52.5
%{_mandir}/man5/srec_fairchild.5
%{_mandir}/man5/srec_fastload.5
%{_mandir}/man5/srec_formatted_binary.5
%{_mandir}/man5/srec_forth.5
%{_mandir}/man5/srec_fpc.5
%{_mandir}/man5/srec_intel.5
%{_mandir}/man5/srec_intel16.5
%{_mandir}/man5/srec_mif.5
%{_mandir}/man5/srec_mos_tech.5
%{_mandir}/man5/srec_motorola.5
%{_mandir}/man5/srec_msbin.5
%{_mandir}/man5/srec_needham.5
%{_mandir}/man5/srec_os65v.5
%{_mandir}/man5/srec_signetics.5
%{_mandir}/man5/srec_spasm.5
%{_mandir}/man5/srec_spectrum.5
%{_mandir}/man5/srec_stewie.5
%{_mandir}/man5/srec_tektronix.5
%{_mandir}/man5/srec_tektronix_extended.5
%{_mandir}/man5/srec_ti_tagged.5
%{_mandir}/man5/srec_ti_tagged_16.5
%{_mandir}/man5/srec_ti_txt.5
%{_mandir}/man5/srec_vmem.5
%{_mandir}/man5/srec_wilson.5


%files libs
%defattr (-,root,root,-)
%{_libdir}/libsrecord.so
%{_libdir}/libsrecord.so.*


%files devel
%defattr (-,root,root,-)
%dir %{_includedir}/srecord
%dir %{_libdir}/pkgconfig
%dir %{_mandir}/man3
%{_includedir}/srecord/*.h
%{_libdir}/libsrecord.a
%{_libdir}/libsrecord.la
%{_libdir}/pkgconfig/srecord.pc
%{_mandir}/man3/srecord.3
%{_mandir}/man3/srecord_license.3

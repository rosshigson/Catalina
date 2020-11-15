#
# This file is generated.  Please do not send the maintainer
# patches to this file.  Please update etc/spec.sh and send a
# patch to that file, instead.
#
Summary: Manipulate EPROM load files
Name: srecord
Version: 1.47
Release: 1
License: GPL
Group: Development/Tools
Source: http://srecord.sourceforge.net/%{name}-%{version}.tar.gz
URL: http://srecord.sourceforge.net/
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

BuildRequires:  diffutils, sharutils, groff, gcc-c++, boost-devel

%description
The SRecord package is a collection of powerful tools for manipulating
EPROM load files.

* The SRecord package understands a number of file formats: Motorola
  S-Record, Intel, Tektronix, Binary.  These file formats may be read
  and written.  Also C array definitions, for output only.

* The SRecord package has a number of tools: srec_cat for copying and
  and converting files, srec_cmp for comparing files and srec_info for
  printing summaries.

* The SRecord package has a number for filters: checksum to add checksums
  to the data, crop to keep address ranges, exclude to remove address
  ranges, fill to plug holes in the data, length to insert the data
  length, maximum to insert the data address maximum, minimum to insert
  the data address minimum, offset to adjust addresses, and split for
  wide data buses and memory striping.

More than one filter may be applied to each input file.  Different filters
may be applied to each input file.  All filters may be applied to all
file formats.


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
%{_mandir}/man1/srec_cat.1*
%{_mandir}/man1/srec_cmp.1*
%{_mandir}/man1/srec_examples.1*
%{_mandir}/man1/srec_info.1*
%{_mandir}/man1/srec_input.1*
%{_mandir}/man1/srec_license.1*
%{_mandir}/man5/srec_aomf.5*
%{_mandir}/man5/srec_ascii_hex.5*
%{_mandir}/man5/srec_atmel_generic.5*
%{_mandir}/man5/srec_binary.5*
%{_mandir}/man5/srec_brecord.5*
%{_mandir}/man5/srec_cosmac.5*
%{_mandir}/man5/srec_dec_binary.5*
%{_mandir}/man5/srec_emon52.5*
%{_mandir}/man5/srec_fairchild.5*
%{_mandir}/man5/srec_fastload.5*
%{_mandir}/man5/srec_formatted_binary.5*
%{_mandir}/man5/srec_forth.5*
%{_mandir}/man5/srec_fpc.5*
%{_mandir}/man5/srec_intel16.5*
%{_mandir}/man5/srec_intel.5*
%{_mandir}/man5/srec_mif.5*
%{_mandir}/man5/srec_mos_tech.5*
%{_mandir}/man5/srec_motorola.5*
%{_mandir}/man5/srec_needham.5*
%{_mandir}/man5/srec_os65v.5*
%{_mandir}/man5/srec_signetics.5*
%{_mandir}/man5/srec_spasm.5*
%{_mandir}/man5/srec_spectrum.5*
%{_mandir}/man5/srec_stewie.5*
%{_mandir}/man5/srec_tektronix.5*
%{_mandir}/man5/srec_tektronix_extended.5*
%{_mandir}/man5/srec_ti_tagged_16.5*
%{_mandir}/man5/srec_ti_tagged.5*
%{_mandir}/man5/srec_ti_txt.5*
%{_mandir}/man5/srec_vmem.5*
%{_mandir}/man5/srec_wilson.5*

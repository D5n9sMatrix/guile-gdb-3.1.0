<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "https://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)https://www.sourceware.org/gdb/documentation/ -->
<html xmlns="https://www.w3.org/1999/xhtml" xml:lang="en" lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="shortcut icon" type="image/x-icon" href="https://www.sourceware.org/gdb/images/archer-fish.ico">
<meta name="keywords" content="gdb">

<title>GDB Documentation</title>

</head>

<body bgcolor="#FFFFFF" text="#000000" link="#1F00FF" alink="#FF0000" vlink="#9900DD">

<a href="https://www.sourceware.org/gdb/mascot/"> <img border="0" src="./README_files/archer.svg" align="right" alt="[image of Archer
Fish]"></a>

<center><h1>GDB: The GNU Project Debugger</h1></center>

<center>
<small>
[<a href="https://www.sourceware.org/gdb/bugs/">bugs</a>]
[<a href="https://www.sourceware.org/gdb/committee/">GDB Maintainers</a>]
[<a href="https://www.sourceware.org/gdb/contribute/">contributing</a>]
[<a href="https://www.sourceware.org/gdb/current/">current git</a>]
[<a href="https://www.sourceware.org/gdb/documentation/">documentation</a>]
[<a href="https://www.sourceware.org/gdb/download/">download</a>]
[<a href="https://www.sourceware.org/gdb/">home</a>]
[<a href="https://www.sourceware.org/gdb/irc/">irc</a>]
[<a href="https://www.sourceware.org/gdb/links/">links</a>]
[<a href="https://www.sourceware.org/gdb/mailing-lists/">mailing lists</a>]
[<a href="https://www.sourceware.org/gdb/news/">news</a>]
[<a href="https://www.sourceware.org/gdb/schedule/">schedule</a>]
[<a href="https://www.sourceware.org/gdb/song/">song</a>]
[<a href="https://sourceware.org/gdb/wiki/">wiki</a>]
</small>
</center>

<center><h2>GDB Documentation</h2></center>

<!-- NB: CURRENT / LATEST refer to the trunk -->
<!-- NB: MOST RECENT refers to the branch -->

<!-- body, update above using ../../gdb/index.sh -->

<h3>Printed Manuals</h3>

The <a href="https://www.gnu.org/doc/gnupresspub.html">GNU Press</a>
has printed versions of most manuals, including <a href="https://shop.fsf.org/product/debugging-gdb-gnu-source-level-debugger/">Debugging with GDB</a>
available.

<h3>Online GDB manuals</h3>

Documentation generated from the <a href="https://www.sourceware.org/gdb/current/">current</a>
sources are available online:

<dl>

<dt><a href="https://sourceware.org/gdb/current/onlinedocs/gdb.html/"><b>GDB
        User Manual</b></a> (<a href="https://sourceware.org/gdb/current/onlinedocs/gdb">single page</a>) (<a href="https://sourceware.org/gdb/current/onlinedocs/gdb.pdf">PDF</a>)</dt>

<dd>Describes how to use GDB.<br> Translations are also available:

<ul>

<li>Japanese, by Kazuhisa Ichikawa as part of <a href="https://www.asahi-net.or.jp/~wg5k-ickw/">KI's Unofficial GNU
Manual Translation Project</a>.

</li></ul>
</dd>

<dt><a href="https://sourceware.org/gdb/wiki/InternalsManual"><b>GDB
Internals Manual</b></a> (wiki only)</dt>

<dd>Technical details of the internals of GDB.</dd>

</dl>

The documentation is also available for <a href="https://sourceware.org/gdb/current/onlinedocs/">download</a>
in a number of different formats including (HTML, DVI, PS and PDF).<p>

Versions of the documentation generated from the last <a href="https://sourceware.org/gdb/download/onlinedocs/">release</a>
and most recent <a href="https://sourceware.org/gdb/onlinedocs/">branch</a>
are also available.

</p><h3>Reference Material</h3>

Additional documentation includes:

<ul>

<li>The <a href="https://www.gnu.org/prep/standards_toc.html">GNU
Coding standards</a> written by Richard Stallman and other GNU Project
volunteers. Its purpose is to make the GNU system clean, consistent,
and easy to install.  You may also want to read <a href="https://www.fsf.org/prep/maintain_toc.html">Information For
Maintainers of GNU Software</a>.</li>

<li><a href="https://sourceware.org/gdb/current/onlinedocs/stabs_toc.html">Stabs
debug format documentation</a></li>

<li><a href="https://sourceware.org/gdb/papers/libgdb2/">The libGDB
architecture</a>, Andrew Cagney

</li><li><a href="https://sourceware.org/gdb/papers/multi-arch/">Notes
on multi-arch work</a>

</li><li><a href="https://sourceware.org/gdb/papers/linux/">Linux</a>
materials

</li><li><a href="https://sourceware.org/gdb/papers/unwind.html">Unwinding</a> the stack</li>

<li><a href="https://sourceware.org/gdb/talks/esc-west-1999/">The
Heisenberg Debugging Technology</a> - the Introspect feature of GDB
allows users to record and play back debugging sessions on a remote
embedded system.</li>

</ul>

<h3>GDB interfaces and standards</h3>

<h4>Object files and debugging formats</h4>

<ul>

<li><a href="https://www.sco.com/developer/devspecs/">SCO's page</a>
contains specifications for the ELF executable format, x86 calling
conventions, and more.</li>

<li><a href="https://reality.sgi.com/dehnert_engr/cxx/">C++ ABI</a>
project (being written for IA-64 but probably is mostly processor
independent).

</li><li><a href="https://www.debian.org/Lists-Archives/lsb-spec-9912/msg00021.html">Quick note on future ELF revisions</a></li>

<li>GNU extensions for <a href="https://www.debian.org/Lists-Archives/lsb-spec-9912/msg00017.html">ELF symbol versioning</a>

</li><li><a href="https://www.linuxbase.org/">Linux Standard Base (LSB)</a>
standardizes ELF and such, as implemented on Linux.</li>

<li>DWARF information from <a href="https://reality.sgi.com/davea/objectinfo.html">davea</a>.

</li><li><a href="https://www.eagercon.com/dwarf/dwarf3std.htm">Dwarf 3
Standards Committee</a>.

</li></ul>

<h4>Architecture manuals</h4>

<p>Also see <a href="https://gcc.gnu.org/readings.html">Chip
Documentation</a> from GCC.

</p><ul>

<li>x86: See "Intel documentation" on <a href="https://www.x86.org/">x86.org</a></li>

<li>Alpha: <a href="https://www.alphalinux.org/docs/alphaahb.html">The
Alpha Architecture Handbook</a></li>

<li>V850: Look for V850 on NEC's <a href="https://www.ic.nec.co.jp/english/products/micro/doc.html">Document of Microprocessor/Microcontroller</a> page.  Also see <a href="https://www.cygnus.com/pubs/gnupro/6_embed/embV850.html">NEC
V850 development</a></li>

</ul>

<!-- /body, update below using ../../gdb/index.sh -->

<p></p>

<center>
<small>
[<a href="https://www.sourceware.org/gdb/bugs/">bugs</a>]
[<a href="https://www.sourceware.org/gdb/committee/">GDB Maintainers</a>]
[<a href="https://www.sourceware.org/gdb/contribute/">contributing</a>]
[<a href="https://www.sourceware.org/gdb/current/">current git</a>]
[<a href="https://www.sourceware.org/gdb/documentation/">documentation</a>]
[<a href="https://www.sourceware.org/gdb/download/">download</a>]
[<a href="https://www.sourceware.org/gdb/">home</a>]
[<a href="https://www.sourceware.org/gdb/irc/">irc</a>]
[<a href="https://www.sourceware.org/gdb/links/">links</a>]
[<a href="https://www.sourceware.org/gdb/mailing-lists/">mailing lists</a>]
[<a href="https://www.sourceware.org/gdb/news/">news</a>]
[<a href="https://www.sourceware.org/gdb/schedule/">schedule</a>]
[<a href="https://www.sourceware.org/gdb/song/">song</a>]
[<a href="https://sourceware.org/gdb/wiki/">wiki</a>]
</small>
</center>

<hr>

<address>

<p>Please send FSF &amp; GNU inquiries &amp; questions to <a href="mailto:gnu@gnu.org">gnu@gnu.org</a>.  There are also <a href="https://www.gnu.org/home.html#ContactInfo">other ways to
contact</a> the FSF.</p>

<p>This page is maintained by <a href="https://www.sourceware.org/gdb/">the GDB
developers</a>.</p>

<p>Copyright Free Software Foundation, Inc., 51 Franklin St - Fifth
Floor, Boston, MA 02110-1301 USA.</p>

<p>Verbatim copying and distribution of this entire article is
permitted in any medium, provided this notice is preserved.</p>

<p>Last modified 2023-01-16.</p>
</address>



</body></html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><script>var pmblock = 1.4;</script><!-- This manual documents Guile version 3.0.5.

Copyright (C) 1996-1997, 2000-2005, 2009-2020 Free Software Foundation,
Inc.

Permission is granted to copy, distribute and/or modify this document
under the terms of the GNU Free Documentation License, Version 1.3 or
any later version published by the Free Software Foundation; with no
Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.  A
copy of the license is included in the section entitled "GNU Free
Documentation License." --><!-- Created by GNU Texinfo 6.7, http://www.gnu.org/software/texinfo/ --><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modules and Extensions (Guile Reference Manual)</title>

<meta name="description" content="Modules and Extensions (Guile Reference Manual)">
<meta name="keywords" content="Modules and Extensions (Guile Reference Manual)">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="Generator" content="makeinfo">
<link href="https://www.gnu.org/software/guile/manual/html_node/index.html" rel="start" title="Top">
<link href="https://www.gnu.org/software/guile/manual/html_node/Concept-Index.html" rel="index" title="Concept Index">
<link href="https://www.gnu.org/software/guile/manual/html_node/index.html#SEC_Contents" rel="contents" title="Table of Contents">
<link href="https://www.gnu.org/software/guile/manual/html_node/Foreign-Function-Interface.html" rel="up" title="Foreign Function Interface">
<link href="https://www.gnu.org/software/guile/manual/html_node/Foreign-Pointers.html" rel="next" title="Foreign Pointers">
<link href="https://www.gnu.org/software/guile/manual/html_node/C-Extensions.html" rel="prev" title="C Extensions">
<style type="text/css">
<!--
a.summary-letter {text-decoration: none}
blockquote.indentedblock {margin-right: 0em}
div.display {margin-left: 3.2em}
div.example {margin-left: 3.2em}
div.lisp {margin-left: 3.2em}
kbd {font-style: oblique}
pre.display {font-family: inherit}
pre.format {font-family: inherit}
pre.menu-comment {font-family: serif}
pre.menu-preformatted {font-family: serif}
span.nolinebreak {white-space: nowrap}
span.roman {font-family: initial; font-weight: normal}
span.sansserif {font-family: sans-serif; font-weight: normal}
ul.no-bullet {list-style: none}
-->
</style>
<link rel="stylesheet" type="text/css" href="Modules%20and%20Extensions%20(Guile%20Reference%20Manual)_files/manual.css">


</head>

<body lang="en">
<span id="Modules-and-Extensions"></span><div class="header">
<p>
Next: <a href="https://www.gnu.org/software/guile/manual/html_node/Foreign-Pointers.html" accesskey="n" rel="next">Foreign Pointers</a>, Previous: <a href="https://www.gnu.org/software/guile/manual/html_node/C-Extensions.html" accesskey="p" rel="prev">C Extensions</a>, Up: <a href="https://www.gnu.org/software/guile/manual/html_node/Foreign-Function-Interface.html" accesskey="u" rel="up">Foreign Function Interface</a> &nbsp; [<a href="https://www.gnu.org/software/guile/manual/html_node/index.html#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="https://www.gnu.org/software/guile/manual/html_node/Concept-Index.html" title="Index" rel="index">Index</a>]</p>
</div>
<hr>
<span id="Modules-and-Extensions-1"></span><h4 class="subsection">6.21.4 Modules and Extensions</h4>

<p>The new primitives that you add to Guile with <code>scm_c_define_gsubr</code>
(see <a href="https://www.gnu.org/software/guile/manual/html_node/Primitive-Procedures.html">Primitive Procedures</a>) or with any of the other mechanisms are
placed into the module that is current when the
<code>scm_c_define_gsubr</code> is executed. Extensions loaded from the REPL,
for example, will be placed into the <code>(guile-user)</code> module, if the
REPL module was not changed.
</p>
<p>To define C primitives within a specific module, the simplest way is:
</p>
<div class="example">
<pre class="example">(define-module (foo bar))
(load-extension "foobar-c-code" "foo_bar_init")
</pre></div>

<span id="index-extensiondir-1"></span>
<p>When loaded with <code>(use-modules (foo bar))</code>, the
<code>load-extension</code> call looks for the <samp>foobar-c-code.so</samp> (etc)
object file in Guile’s <code>extensiondir</code>, which is usually a
subdirectory of the <code>libdir</code>. For example, if your libdir is
<samp>/usr/lib</samp>, the <code>extensiondir</code> for the Guile 3.0.<var>x</var>
series will be <samp>/usr/lib/guile/3.0/</samp>.
</p>
<p>The extension path includes the major and minor version of Guile (the
“effective version”), because Guile guarantees compatibility within a
given effective version. This allows you to install different versions
of the same extension for different versions of Guile.
</p>
<p>If the extension is not found in the <code>extensiondir</code>, Guile will
also search the standard system locations, such as <samp>/usr/lib</samp> or
<samp>/usr/local/lib</samp>. It is preferable, however, to keep your extension
out of the system library path, to prevent unintended interference with
other dynamically-linked C libraries.
</p>
<p>If someone installs your module to a non-standard location then the
object file won’t be found.  You can address this by inserting the
install location in the <samp>foo/bar.scm</samp> file.  This is convenient
for the user and also guarantees the intended object is read, even if
stray older or newer versions are in the loader’s path.
</p>
<p>The usual way to specify an install location is with a <code>prefix</code>
at the configure stage, for instance ‘<samp>./configure prefix=/opt</samp>’
results in library files as say <samp>/opt/lib/foobar-c-code.so</samp>.
When using Autoconf (see <a href="https://www.gnu.org/software/autoconf/manual/html_node/index.html#Top">Introduction</a> in <cite>The GNU
Autoconf Manual</cite>), the library location is in a <code>libdir</code>
variable.  Its value is intended to be expanded by <code>make</code>, and
can by substituted into a source file like <samp>foo.scm.in</samp>
</p>
<div class="example">
<pre class="example">(define-module (foo bar))
(load-extension "XXextensiondirXX/foobar-c-code" "foo_bar_init")
</pre></div>

<p>with the following in a <samp>Makefile</samp>, using <code>sed</code>
(see <a href="https://www.gnu.org/software/sed/manual/html_node/index.html#Top">Introduction</a> in <cite>SED, A Stream Editor</cite>),
</p>
<div class="example">
<pre class="example">foo.scm: foo.scm.in
        sed 's|XXextensiondirXX|$(libdir)/guile/3.0|' &lt;foo.scm.in &gt;foo.scm
</pre></div>

<p>The actual pattern <code>XXextensiondirXX</code> is arbitrary, it’s only something
which doesn’t otherwise occur.  If several modules need the value, it
can be easier to create one <samp>foo/config.scm</samp> with a define of the
<code>extensiondir</code> location, and use that as required.
</p>
<div class="example">
<pre class="example">(define-module (foo config))
(define-public foo-config-extensiondir "XXextensiondirXX"")
</pre></div>

<p>Such a file might have other locations too, for instance a data
directory for auxiliary files, or <code>localedir</code> if the module has
its own <code>gettext</code> message catalogue
(see <a href="https://www.gnu.org/software/guile/manual/html_node/Internationalization.html">Internationalization</a>).
</p>
<p>It will be noted all of the above requires that the Scheme code to be
found in <code>%load-path</code> (see <a href="https://www.gnu.org/software/guile/manual/html_node/Load-Paths.html">Load Paths</a>).  Presently it’s left up
to the system administrator or each user to augment that path when
installing Guile modules in non-default locations.  But having reached
the Scheme code, that code should take care of hitting any of its own
private files etc.
</p>

<hr>
<div class="header">
<p>
Next: <a href="https://www.gnu.org/software/guile/manual/html_node/Foreign-Pointers.html" accesskey="n" rel="next">Foreign Pointers</a>, Previous: <a href="https://www.gnu.org/software/guile/manual/html_node/C-Extensions.html" accesskey="p" rel="prev">C Extensions</a>, Up: <a href="https://www.gnu.org/software/guile/manual/html_node/Foreign-Function-Interface.html" accesskey="u" rel="up">Foreign Function Interface</a> &nbsp; [<a href="https://www.gnu.org/software/guile/manual/html_node/index.html#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="https://www.gnu.org/software/guile/manual/html_node/Concept-Index.html" title="Index" rel="index">Index</a>]</p>
</div>





</body></html>

<!-- saved from url=(0079)https://ftp.gnu.org/old-gnu/Manuals/elisp-manual-21-2.8/html_node/elisp_62.html -->
<html><!-- Created on May 2, 2002 by texi2html 1.64 --><!-- 
Written by: Lionel Cons <Lionel.Cons@cern.ch> (original author)
            Karl Berry  <karl@freefriends.org>
            Olaf Bachmann <obachman@mathematik.uni-kl.de>
            and many others.
Maintained by: Olaf Bachmann <obachman@mathematik.uni-kl.de>
Send bugs and suggestions to <texi2html@mathematik.uni-kl.de>
 
--><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>GNU Emacs Lisp Reference Manual: Numeric Conversions</title>

<meta name="description" content="GNU Emacs Lisp Reference Manual: Numeric Conversions">
<meta name="keywords" content="GNU Emacs Lisp Reference Manual: Numeric Conversions">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="Generator" content="texi2html 1.64">

</head>

<body lang="EN" bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000">

<a name="SEC62"></a>
<table cellpadding="1" cellspacing="1" border="0">
<tbody><tr><td valign="MIDDLE" align="LEFT">[<a href="https://ftp.gnu.org/old-gnu/Manuals/elisp-manual-21-2.8/html_node/elisp_61.html#SEC61"> &lt; </a>]</td>
<td valign="MIDDLE" align="LEFT">[<a href="https://ftp.gnu.org/old-gnu/Manuals/elisp-manual-21-2.8/html_node/elisp_63.html#SEC63"> &gt; </a>]</td>
<td valign="MIDDLE" align="LEFT"> &nbsp; </td><td valign="MIDDLE" align="LEFT">[ &lt;&lt; ]</td>
<td valign="MIDDLE" align="LEFT">[<a href="https://ftp.gnu.org/old-gnu/Manuals/elisp-manual-21-2.8/html_node/elisp.html#SEC_Top"> Up </a>]</td>
<td valign="MIDDLE" align="LEFT">[ &gt;&gt; ]</td>
<td valign="MIDDLE" align="LEFT"> &nbsp; </td><td valign="MIDDLE" align="LEFT"> &nbsp; </td><td valign="MIDDLE" align="LEFT"> &nbsp; </td><td valign="MIDDLE" align="LEFT"> &nbsp; </td><td valign="MIDDLE" align="LEFT">[<a href="https://ftp.gnu.org/old-gnu/Manuals/elisp-manual-21-2.8/html_node/elisp.html#SEC_Top">Top</a>]</td>
<td valign="MIDDLE" align="LEFT">[<a href="https://ftp.gnu.org/old-gnu/Manuals/elisp-manual-21-2.8/html_node/elisp_toc.html#SEC_Contents">Contents</a>]</td>
<td valign="MIDDLE" align="LEFT">[<a href="https://ftp.gnu.org/old-gnu/Manuals/elisp-manual-21-2.8/html_node/elisp_728.html#SEC728">Index</a>]</td>
<td valign="MIDDLE" align="LEFT">[<a href="https://ftp.gnu.org/old-gnu/Manuals/elisp-manual-21-2.8/html_node/elisp_abt.html#SEC_About"> ? </a>]</td>
</tr></tbody></table>
<hr size="1">
<h2> 3.5 Numeric Conversions </h2>
<!--docid::SEC62::-->
<p>

To convert an integer to floating point, use the function <code>float</code>.
</p><p>

<a name="IDX98"></a>
</p><dl>
<dt><u>Function:</u> <b>float</b> <i>number</i>
</dt><dd>This returns <var>number</var> converted to floating point.
If <var>number</var> is already a floating point number, <code>float</code> returns
it unchanged.
</dd></dl>
<p></p><p>

There are four functions to convert floating point numbers to integers;
they differ in how they round.  These functions accept integer arguments
also, and return such arguments unchanged.
</p><p>

<a name="IDX99"></a>
</p><dl>
<dt><u>Function:</u> <b>truncate</b> <i>number</i>
</dt><dd>This returns <var>number</var>, converted to an integer by rounding towards
zero.
<p></p><p>

<table><tbody><tr><td>&nbsp;</td><td class="example"><pre>(truncate 1.2)
     =&gt; 1
(truncate 1.7)
     =&gt; 1
(truncate -1.2)
     =&gt; -1
(truncate -1.7)
     =&gt; -1
</pre></td></tr></tbody></table></p></dd></dl>
<p></p><p>

<a name="IDX100"></a>
</p><dl>
<dt><u>Function:</u> <b>floor</b> <i>number &amp;optional divisor</i>
</dt><dd>This returns <var>number</var>, converted to an integer by rounding downward
(towards negative infinity).
<p></p><p>

If <var>divisor</var> is specified, <code>floor</code> divides <var>number</var> by
<var>divisor</var> and then converts to an integer; this uses the kind of
division operation that corresponds to <code>mod</code>, rounding downward.
An <code>arith-error</code> results if <var>divisor</var> is 0.
</p><p>

<table><tbody><tr><td>&nbsp;</td><td class="example"><pre>(floor 1.2)
     =&gt; 1
(floor 1.7)
     =&gt; 1
(floor -1.2)
     =&gt; -2
(floor -1.7)
     =&gt; -2
(floor 5.99 3)
     =&gt; 1
</pre></td></tr></tbody></table></p></dd></dl>
<p></p><p>

<a name="IDX101"></a>
</p><dl>
<dt><u>Function:</u> <b>ceiling</b> <i>number</i>
</dt><dd>This returns <var>number</var>, converted to an integer by rounding upward
(towards positive infinity).
<p></p><p>

<table><tbody><tr><td>&nbsp;</td><td class="example"><pre>(ceiling 1.2)
     =&gt; 2
(ceiling 1.7)
     =&gt; 2
(ceiling -1.2)
     =&gt; -1
(ceiling -1.7)
     =&gt; -1
</pre></td></tr></tbody></table></p></dd></dl>
<p></p><p>

<a name="IDX102"></a>
</p><dl>
<dt><u>Function:</u> <b>round</b> <i>number</i>
</dt><dd>This returns <var>number</var>, converted to an integer by rounding towards the
nearest integer.  Rounding a value equidistant between two integers
may choose the integer closer to zero, or it may prefer an even integer,
depending on your machine.
<p></p><p>

<table><tbody><tr><td>&nbsp;</td><td class="example"><pre>(round 1.2)
     =&gt; 1
(round 1.7)
     =&gt; 2
(round -1.2)
     =&gt; -1
(round -1.7)
     =&gt; -2
</pre></td></tr></tbody></table></p></dd></dl>
<p></p><p>

<a name="Arithmetic Operations"></a>
</p><hr size="1">
<table cellpadding="1" cellspacing="1" border="0">
<tbody><tr><td valign="MIDDLE" align="LEFT">[<a href="https://ftp.gnu.org/old-gnu/Manuals/elisp-manual-21-2.8/html_node/elisp_61.html#SEC61"> &lt; </a>]</td>
<td valign="MIDDLE" align="LEFT">[<a href="https://ftp.gnu.org/old-gnu/Manuals/elisp-manual-21-2.8/html_node/elisp_63.html#SEC63"> &gt; </a>]</td>
<td valign="MIDDLE" align="LEFT"> &nbsp; </td><td valign="MIDDLE" align="LEFT">[ &lt;&lt; ]</td>
<td valign="MIDDLE" align="LEFT">[<a href="https://ftp.gnu.org/old-gnu/Manuals/elisp-manual-21-2.8/html_node/elisp.html#SEC_Top"> Up </a>]</td>
<td valign="MIDDLE" align="LEFT">[ &gt;&gt; ]</td>
<td valign="MIDDLE" align="LEFT"> &nbsp; </td><td valign="MIDDLE" align="LEFT"> &nbsp; </td><td valign="MIDDLE" align="LEFT"> &nbsp; </td><td valign="MIDDLE" align="LEFT"> &nbsp; </td><td valign="MIDDLE" align="LEFT">[<a href="https://ftp.gnu.org/old-gnu/Manuals/elisp-manual-21-2.8/html_node/elisp.html#SEC_Top">Top</a>]</td>
<td valign="MIDDLE" align="LEFT">[<a href="https://ftp.gnu.org/old-gnu/Manuals/elisp-manual-21-2.8/html_node/elisp_toc.html#SEC_Contents">Contents</a>]</td>
<td valign="MIDDLE" align="LEFT">[<a href="https://ftp.gnu.org/old-gnu/Manuals/elisp-manual-21-2.8/html_node/elisp_728.html#SEC728">Index</a>]</td>
<td valign="MIDDLE" align="LEFT">[<a href="https://ftp.gnu.org/old-gnu/Manuals/elisp-manual-21-2.8/html_node/elisp_abt.html#SEC_About"> ? </a>]</td>
</tr></tbody></table>
<br>  
<font size="-1">
This document was generated
on <i>May 2, 2002</i>
using <a href="http://www.mathematik.uni-kl.de/~obachman/Texi2html"><i>texi2html</i></a>



</font></body></html>
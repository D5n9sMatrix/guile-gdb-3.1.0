<!DOCTYPE html>
<!-- saved from url=(0084)https://www.gnu.org/software/emacs/manual/html_node/elisp/Arithmetic-Operations.html -->
<html><!-- Created by GNU Texinfo 7.0.3, https://www.gnu.org/software/texinfo/ --><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Arithmetic Operations (GNU Emacs Lisp Reference Manual)</title>

<meta name="description" content="Arithmetic Operations (GNU Emacs Lisp Reference Manual)">
<meta name="keywords" content="Arithmetic Operations (GNU Emacs Lisp Reference Manual)">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="Generator" content="makeinfo">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link rev="made" href="mailto:bug-gnu-emacs@gnu.org">
<link rel="icon" type="image/png" href="https://www.gnu.org/graphics/gnu-head-mini.png">
<meta name="ICBM" content="42.256233,-71.006581">
<meta name="DC.title" content="gnu.org">
<style type="text/css">
@import url('/software/emacs/manual.css');
</style>
</head>

<body lang="en">
<div class="section-level-extent" id="Arithmetic-Operations">
<div class="nav-panel">
<p>
Next: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Rounding-Operations.html" accesskey="n" rel="next">Rounding Operations</a>, Previous: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Numeric-Conversions.html" accesskey="p" rel="prev">Numeric Conversions</a>, Up: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Numbers.html" accesskey="u" rel="up">Numbers</a> &nbsp; [<a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/index.html#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Index.html" title="Index" rel="index">Index</a>]</p>
</div>
<hr>
<h3 class="section" id="Arithmetic-Operations-1">3.6 Arithmetic Operations</h3>
<a class="index-entry-id" id="index-arithmetic-operations"></a>

<p>Emacs Lisp provides the traditional four arithmetic operations
(addition, subtraction, multiplication, and division), as well as
remainder and modulus functions, and functions to add or subtract 1.
Except for <code class="code">%</code>, each of these functions accepts both integer and
floating-point arguments, and returns a floating-point number if any
argument is floating point.
</p>
<dl class="first-deffn first-defun-alias-first-deffn">
<dt class="deffn defun-alias-deffn" id="index-1_002b"><span class="category-def">Function: </span><span><strong class="def-name">1+</strong> <var class="def-var-arguments">number-or-marker</var><a class="copiable-link" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Arithmetic-Operations.html#index-1_002b"> ¶</a></span></dt>
<dd><p>This function returns <var class="var">number-or-marker</var> plus 1.
For example,
</p>
<div class="example">
<pre class="example-preformatted">(setq foo 4)
     ⇒ 4
(1+ foo)
     ⇒ 5
</pre></div>

<p>This function is not analogous to the C operator <code class="code">++</code>—it does not
increment a variable.  It just computes a sum.  Thus, if we continue,
</p>
<div class="example">
<pre class="example-preformatted">foo
     ⇒ 4
</pre></div>

<p>If you want to increment the variable, you must use <code class="code">setq</code>,
like this:
</p>
<div class="example">
<pre class="example-preformatted">(setq foo (1+ foo))
     ⇒ 5
</pre></div>
</dd></dl>

<dl class="first-deffn first-defun-alias-first-deffn">
<dt class="deffn defun-alias-deffn" id="index-1_002d"><span class="category-def">Function: </span><span><strong class="def-name">1-</strong> <var class="def-var-arguments">number-or-marker</var><a class="copiable-link" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Arithmetic-Operations.html#index-1_002d"> ¶</a></span></dt>
<dd><p>This function returns <var class="var">number-or-marker</var> minus 1.
</p></dd></dl>

<dl class="first-deffn first-defun-alias-first-deffn">
<dt class="deffn defun-alias-deffn" id="index-_002b"><span class="category-def">Function: </span><span><strong class="def-name">+</strong> <var class="def-var-arguments">&amp;rest numbers-or-markers</var><a class="copiable-link" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Arithmetic-Operations.html#index-_002b"> ¶</a></span></dt>
<dd><p>This function adds its arguments together.  When given no arguments,
<code class="code">+</code> returns 0.
</p>
<div class="example">
<pre class="example-preformatted">(+)
     ⇒ 0
(+ 1)
     ⇒ 1
(+ 1 2 3 4)
     ⇒ 10
</pre></div>
</dd></dl>

<dl class="first-deffn first-defun-alias-first-deffn">
<dt class="deffn defun-alias-deffn" id="index-_002d"><span class="category-def">Function: </span><span><strong class="def-name">-</strong> <var class="def-var-arguments">&amp;optional number-or-marker &amp;rest more-numbers-or-markers</var><a class="copiable-link" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Arithmetic-Operations.html#index-_002d"> ¶</a></span></dt>
<dd><p>The <code class="code">-</code> function serves two purposes: negation and subtraction.
When <code class="code">-</code> has a single argument, the value is the negative of the
argument.  When there are multiple arguments, <code class="code">-</code> subtracts each of
the <var class="var">more-numbers-or-markers</var> from <var class="var">number-or-marker</var>,
cumulatively.  If there are no arguments, the result is 0.
</p>
<div class="example">
<pre class="example-preformatted">(- 10 1 2 3 4)
     ⇒ 0
(- 10)
     ⇒ -10
(-)
     ⇒ 0
</pre></div>
</dd></dl>

<dl class="first-deffn first-defun-alias-first-deffn">
<dt class="deffn defun-alias-deffn" id="index-_002a"><span class="category-def">Function: </span><span><strong class="def-name">*</strong> <var class="def-var-arguments">&amp;rest numbers-or-markers</var><a class="copiable-link" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Arithmetic-Operations.html#index-_002a"> ¶</a></span></dt>
<dd><p>This function multiplies its arguments together, and returns the
product.  When given no arguments, <code class="code">*</code> returns 1.
</p>
<div class="example">
<pre class="example-preformatted">(*)
     ⇒ 1
(* 1)
     ⇒ 1
(* 1 2 3 4)
     ⇒ 24
</pre></div>
</dd></dl>

<dl class="first-deffn first-defun-alias-first-deffn">
<dt class="deffn defun-alias-deffn" id="index-_002f"><span class="category-def">Function: </span><span><strong class="def-name">/</strong> <var class="def-var-arguments">number &amp;rest divisors</var><a class="copiable-link" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Arithmetic-Operations.html#index-_002f"> ¶</a></span></dt>
<dd><p>With one or more <var class="var">divisors</var>, this function divides <var class="var">number</var>
by each divisor in <var class="var">divisors</var> in turn, and returns the quotient.
With no <var class="var">divisors</var>, this function returns 1/<var class="var">number</var>, i.e.,
the multiplicative inverse of <var class="var">number</var>.  Each argument may be a
number or a marker.
</p>
<p>If all the arguments are integers, the result is an integer, obtained
by rounding the quotient towards zero after each division.
</p>
<div class="example">
<div class="group"><pre class="example-preformatted">(/ 6 2)
     ⇒ 3
</pre></div><div class="group"><pre class="example-preformatted">(/ 5 2)
     ⇒ 2
</pre></div><div class="group"><pre class="example-preformatted">(/ 5.0 2)
     ⇒ 2.5
</pre></div><div class="group"><pre class="example-preformatted">(/ 5 2.0)
     ⇒ 2.5
</pre></div><div class="group"><pre class="example-preformatted">(/ 5.0 2.0)
     ⇒ 2.5
</pre></div><div class="group"><pre class="example-preformatted">(/ 4.0)
     ⇒ 0.25
</pre></div><div class="group"><pre class="example-preformatted">(/ 4)
     ⇒ 0
</pre></div><div class="group"><pre class="example-preformatted">(/ 25 3 2)
     ⇒ 4
</pre></div><div class="group"><pre class="example-preformatted">(/ -17 6)
     ⇒ -2
</pre></div></div>

<a class="index-entry-id" id="index-arith_002derror-in-division"></a>
<p>If you divide an integer by the integer 0, Emacs signals an
<code class="code">arith-error</code> error (see <a class="pxref" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Errors.html">Errors</a>).  On systems using IEEE-754
floating-point, floating-point division of a nonzero number by zero
yields either positive or negative infinity (see <a class="pxref" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Float-Basics.html">Floating-Point Basics</a>);
otherwise, an <code class="code">arith-error</code> is signaled as usual.
</p></dd></dl>

<dl class="first-deffn first-defun-alias-first-deffn">
<dt class="deffn defun-alias-deffn" id="index-_0025"><span class="category-def">Function: </span><span><strong class="def-name">%</strong> <var class="def-var-arguments">dividend divisor</var><a class="copiable-link" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Arithmetic-Operations.html#index-_0025"> ¶</a></span></dt>
<dd><a class="index-entry-id" id="index-remainder"></a>
<p>This function returns the integer remainder after division of <var class="var">dividend</var>
by <var class="var">divisor</var>.  The arguments must be integers or markers.
</p>
<p>For any two integers <var class="var">dividend</var> and <var class="var">divisor</var>,
</p>
<div class="example">
<div class="group"><pre class="example-preformatted">(+ (% <var class="var">dividend</var> <var class="var">divisor</var>)
   (* (/ <var class="var">dividend</var> <var class="var">divisor</var>) <var class="var">divisor</var>))
</pre></div></div>

<p>always equals <var class="var">dividend</var> if <var class="var">divisor</var> is nonzero.
</p>
<div class="example">
<pre class="example-preformatted">(% 9 4)
     ⇒ 1
(% -9 4)
     ⇒ -1
(% 9 -4)
     ⇒ 1
(% -9 -4)
     ⇒ -1
</pre></div>
</dd></dl>

<dl class="first-deffn first-defun-alias-first-deffn">
<dt class="deffn defun-alias-deffn" id="index-mod"><span class="category-def">Function: </span><span><strong class="def-name">mod</strong> <var class="def-var-arguments">dividend divisor</var><a class="copiable-link" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Arithmetic-Operations.html#index-mod"> ¶</a></span></dt>
<dd><a class="index-entry-id" id="index-modulus"></a>
<p>This function returns the value of <var class="var">dividend</var> modulo <var class="var">divisor</var>;
in other words, the remainder after division of <var class="var">dividend</var>
by <var class="var">divisor</var>, but with the same sign as <var class="var">divisor</var>.
The arguments must be numbers or markers.
</p>
<p>Unlike <code class="code">%</code>, <code class="code">mod</code> permits floating-point arguments; it
rounds the quotient downward (towards minus infinity) to an integer,
and uses that quotient to compute the remainder.
</p>
<p>If <var class="var">divisor</var> is zero, <code class="code">mod</code> signals an <code class="code">arith-error</code>
error if both arguments are integers, and returns a NaN otherwise.
</p>
<div class="example">
<div class="group"><pre class="example-preformatted">(mod 9 4)
     ⇒ 1
</pre></div><div class="group"><pre class="example-preformatted">(mod -9 4)
     ⇒ 3
</pre></div><div class="group"><pre class="example-preformatted">(mod 9 -4)
     ⇒ -3
</pre></div><div class="group"><pre class="example-preformatted">(mod -9 -4)
     ⇒ -1
</pre></div><div class="group"><pre class="example-preformatted">(mod 5.5 2.5)
     ⇒ .5
</pre></div></div>

<p>For any two numbers <var class="var">dividend</var> and <var class="var">divisor</var>,
</p>
<div class="example">
<div class="group"><pre class="example-preformatted">(+ (mod <var class="var">dividend</var> <var class="var">divisor</var>)
   (* (floor <var class="var">dividend</var> <var class="var">divisor</var>) <var class="var">divisor</var>))
</pre></div></div>

<p>always equals <var class="var">dividend</var>, subject to rounding error if either
argument is floating point and to an <code class="code">arith-error</code> if <var class="var">dividend</var> is an
integer and <var class="var">divisor</var> is 0.  For <code class="code">floor</code>, see <a class="ref" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Numeric-Conversions.html">Numeric Conversions</a>.
</p></dd></dl>

</div>
<hr>
<div class="nav-panel">
<p>
Next: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Rounding-Operations.html">Rounding Operations</a>, Previous: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Numeric-Conversions.html">Numeric Conversions</a>, Up: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Numbers.html">Numbers</a> &nbsp; [<a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/index.html#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Index.html" title="Index" rel="index">Index</a>]</p>
</div>





</body></html>
<!DOCTYPE html>
<!-- saved from url=(0073)https://www.gnu.org/software/emacs/manual/html_node/elisp/Mutability.html -->
<html><!-- Created by GNU Texinfo 7.0.3, https://www.gnu.org/software/texinfo/ --><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Mutability (GNU Emacs Lisp Reference Manual)</title>

<meta name="description" content="Mutability (GNU Emacs Lisp Reference Manual)">
<meta name="keywords" content="Mutability (GNU Emacs Lisp Reference Manual)">
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
<div class="section-level-extent" id="Mutability">
<div class="nav-panel">
<p>
Previous: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Equality-Predicates.html" accesskey="p" rel="prev">Equality Predicates</a>, Up: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Lisp-Data-Types.html" accesskey="u" rel="up">Lisp Data Types</a> &nbsp; [<a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/index.html#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Index.html" title="Index" rel="index">Index</a>]</p>
</div>
<hr>
<h3 class="section" id="Mutability-1">2.9 Mutability</h3>
<a class="index-entry-id" id="index-mutable-objects"></a>

<p>Some Lisp objects should never change.  For example, the Lisp
expression <code class="code">"aaa"</code> yields a string, but you should not change
its contents.  And some objects cannot be changed; for example,
although you can create a new number by calculating one, Lisp provides
no operation to change the value of an existing number.
</p>
<p>Other Lisp objects are <em class="dfn">mutable</em>: it is safe to change their
values via destructive operations involving side effects.  For
example, an existing marker can be changed by moving the marker to
point to somewhere else.
</p>
<p>Although numbers never change and all markers are mutable,
some types have members some of which are mutable and others not.  These
types include conses, vectors, and strings.  For example,
although <code class="code">"cons"</code> and <code class="code">(symbol-name 'cons)</code> both yield
strings that should not be changed, <code class="code">(copy-sequence "cons")</code> and
<code class="code">(make-string 3 ?a)</code> both yield mutable strings that can be
changed via later calls to <code class="code">aset</code>.
</p>
<p>A mutable object stops being mutable if it is part of an expression
that is evaluated.  For example:
</p>
<div class="example">
<pre class="example-preformatted">(let* ((x (list 0.5))
       (y (eval (list 'quote x))))
  (setcar x 1.5) ;; The program should not do this.
  y)
</pre></div>

<p>Although the list <code class="code">(0.5)</code> was mutable when it was created, it should not
have been changed via <code class="code">setcar</code> because it was given to <code class="code">eval</code>.  The
reverse does not occur: an object that should not be changed never
becomes mutable afterwards.
</p>
<p>If a program attempts to change objects that should not be
changed, the resulting behavior is undefined: the Lisp interpreter
might signal an error, or it might crash or behave unpredictably in
other ways.<a class="footnote" id="DOCF2" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Mutability.html#FOOT2"><sup>2</sup></a>
</p>
<p>When similar constants occur as parts of a program, the Lisp
interpreter might save time or space by reusing existing constants or
their components.  For example, <code class="code">(eq "abc" "abc")</code> returns
<code class="code">t</code> if the interpreter creates only one instance of the string
literal <code class="code">"abc"</code>, and returns <code class="code">nil</code> if it creates two
instances.  Lisp programs should be written so that they work
regardless of whether this optimization is in use.
</p></div>
<div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT2" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Mutability.html#DOCF2">(2)</a></h5>
<p>This is the behavior specified for languages like
Common Lisp and C for constants, and this differs from languages like
JavaScript and Python where an interpreter is required to signal an
error if a program attempts to change an immutable object.  Ideally the Emacs
Lisp interpreter will evolve in latter direction.</p>
</div>
<hr>
<div class="nav-panel">
<p>
Previous: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Equality-Predicates.html">Equality Predicates</a>, Up: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Lisp-Data-Types.html">Lisp Data Types</a> &nbsp; [<a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/index.html#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Index.html" title="Index" rel="index">Index</a>]</p>
</div>





</body></html>
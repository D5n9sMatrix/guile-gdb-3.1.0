=head1 NAME
 
recs-collate
 
=head1 recs-collate --help-all
 
 Help from: --help-aggregators:
 array: collect values from provided field into an array
 average, avg: averages provided field
 cb, countby: counts by unique value for a field
 concat, concatenate: concatenate values from provided field
 corr, correl, correlation: find correlation of provided fields
 count, ct: counts (non-unique) records
 cov, covar, covariance: find covariance of provided fields
 dcount, dct, distinctcount, distinctct: count unique values from provided field
 first: first value for a field
 firstrec, firstrecord: first record
 last: last value for a field
 lastrec, lastrecord: last record seen
 linearregression, linreg: perform a linear regression of provided fields, dumping various statistics
 max, maximum: maximum value for a field
 min, minimum: minimum value for a field
 mode: most common value for a field
 perc, percentile: value of pXX for field
 percentilemap, percmap: map of percentile values for field
 recformax, recformaximum, recordformax, recordformaximum: returns the record corresponding to the maximum value for a field
 recformin, recforminimum, recordformin, recordforminimum: returns the record corresponding to the minimum value for a field
 records, recs: returns an arrayref of all records
 stddev: find standard deviation of provided field
 sum: sums provided field
 uarray: collect unique values from provided field into an array
 uconcat, uconcatenate: concatenate unique values from provided field
 valuestokeys, vk: use one key-value as a key for a different value in the record
 var, variance: find variance of provided field
  
 Help from: --help-basic:
 Usage: recs-collate <args> [<files>]
    Take records, grouped togther by --keys, and compute statistics (like
    average, count, sum, concat, etc) within those groups.
  
    For starting with collate, try doing single --key collates with some number
    of aggregators (list available in --list-agrregators)
  
 Arguments:
    --dlaggregator|-A ...                         Specify a domain language
                                                  aggregate. See "Domain Language
                                                  Integration" below.
    --aggregator|-a <aggregators>                 Colon separated list of
                                                  aggregate field specifiers. See
                                                  "Aggregates" section below.
    --mr-agg <name> <map> <reduce> <squish>       Specify a map reduce
                                                  aggregator via 3 snippets,
                                                  similar to mr_agg() from the
                                                  domain language.
    --ii-agg <name> <initial> <combine> <squish>  Specify an inject into
                                                  aggregator via 3 snippets,
                                                  similar to ii_agg() from the
                                                  domain language.
    --incremental                                 Output a record every time an
                                                  input record is added to a
                                                  clump (instead of every time a
                                                  clump is flushed).
    --[no]-bucket                                 With --bucket outputs one
                                                  record per clump, with --no-
                                                  bucket outputs one record for
                                                  each record that went into
                                                  the clump.
    --key|-k <keys>                               Comma separated list of key
                                                  fields. May be a key spec or
                                                  key group
    --dlkey|-K ...                                Specify a domain language key.
                                                  See "Domain Language
                                                  Integration" section in --help-
                                                  more.
    --size|--sz|-n <number>                       Number of running clumps to
                                                  keep.
    --adjacent|-1                                 Only group together adjacent
                                                  records. Avoids spooling
                                                  records into memeory
    --cube                                        See "Cubing" section in --help-
                                                  more.
    --clumper ...                                 Use this clumper to group
                                                  records. May be specified
                                                  multiple times. See --help-
                                                  clumping.
    --dlclumper ...                               Use this domain language
                                                  clumper to group records. May
                                                  be specified multiple times.
                                                  See --help-clumping.
    --list-aggregators|--list                     Bail and output a list of
                                                  aggregators
    --show-aggregator <aggregator>                Bail and output this
                                                  aggregator's detailed usage.
    --list-clumpers                               Bail and output a list of
                                                  clumpers
    --show-clumper <clumper>                      Bail and output this clumper's
                                                  detailed usage.
    --filename-key|fk <keyspec>                   Add a key with the source
                                                  filename (if no filename is
                                                  applicable will put NONE)
  
   Help Options:
       --help-aggregators     List the aggregators
       --help-all             Output all help for this script
       --help                 This help screen
       --help-clumping        Help on clumping; mechanisms to group records
                              across a stream
       --help-domainlanguage  Help on the recs domain language, a [very
                              complicated] way of specifying valuations (which
                              act like keys) or aggregators
       --help-keygroups       Help on keygroups, a way of specifying
                              multiple keys
       --help-keys            Help on keygroups and keyspecs
       --help-keyspecs        Help on keyspecs, a way to index deeply and
                              with regexes
       --help-more            Larger help documentation
  
 Examples:
    Count clumps of adjacent lines with matching x fields.
       recs-collate --adjacent --key x --aggregator count
    Count number of each x field value in the entire file.
       recs-collate --key x --aggregator count
    Finds the maximum latency for each date, hour pair
       recs-collate --key date,hour --aggregator worst_latency=max,latency
    Find the median value of x+y in records
       recs-collate --dlaggregator "m=perc(50,snip(<<{{x}}+{{y}}>>))"
  
 Help from: --help-clumping:
 CLUMPING:
    "Clumping" defines a way of taking a stream of input records and rearranging
    them into to groups for consideration. The most common "consideration" for
    such a group of records is the application of one or more aggregators by recs-
    collate and the most common clumpers are those specifiable by recs-collate's
    normal options. However, other recs scripts can use "clumpers" and much more
    complex clumping is possible. A list of clumpers can be found via the --list-
    clumpers option on recs-collate and documentation for individual clumpers can
    be inspected via --show-clumper.
  
 Examples:
    Group adjacent records for each host and output each such group's size.
       recs-collate -c keylru,host,1 -a ct
    Output the successive differences of the time field.
       recs-collate -c window,2 --dla 'time_delta=xform(recs, <<{{#1/time}} - {{#0/time}}>>)'
  
 Full list:
    cubekeyperfect: clump records by the value for a key, additionally cubing them
    keylru: clump records by the value for a key, limiting number of active clumps
    keyperfect: clump records by the value for a key
    window: clump records by a rolling window
  
 Help from: --help-domainlanguage:
 DOMAIN LANGUAGE
    The normal mechanism for specifying keys and aggregators allows one to
    concisely instantiate the objects that back them in the platform and is
    certainly the easiest way to use recs. The record stream domain language
    allows the creation of these objects in a programmatic way, with neither the
    syntactic issues of the normal way nor its guiding hand.
  
    The domain language is itself just Perl with a collection of library
    functions for creating platform objects included. Your favorite aggregators
    are all here with constructors matching their normal token. For convenience
    of e.g. last, aggregators are also included with a prefixed underscore.
  
    Below you can find documentation on all the "built in" functions. Most
    aggregators and deaggregators should be present with arguments comparable to
    their normal instantiation arugments, but with keyspec parameters replaced
    with valuations parameters.
  
 Special Syntax
    Where one sees a <snippet> argument below, a string scalar is expected,
    however quoting these can get fairly difficult and they can be confused with
    non-<snippet> scalars.
  
    Example:
      --dla "silly= uconcat(',', snip('{{x}} * 2'))"
  
    To remedy this, one may use <<CODE>> to inline a snippet which will be
    immediately understood by the typing mechanism as being code. Escaping inside
    this is as single quotes in Perl.
  
    Example With <<CODE>>
      --dla 'silly= uconcat(",", <<{{x}} * 2>>)'
  
    Furthermore one may mark variables to be propagated in by prefixing CODE like
    <<var1,var2,var3|CODE>>:
      --dla 'silly= $f=2; uconcat(",", <<f|{{x}} * $f>>)'
  
 Function Library
    ii_agg(<snippet>, <snippet>[, <snippet>])
    ii_aggregator(<snippet>, <snippet>[, <snippet>])
    inject_into_agg(<snippet>, <snippet>[, <snippet>])
    inject_into_aggregator(<snippet>, <snippet>[, <snippet>])
       Take an initial snippet, a combine snippet, and an optional squish snippet
       to produce an ad-hoc aggregator based on inject into. The initial snippet
       produces the aggregate value for an empty collection, then combine takes
       $a representing the aggregate value so far and $r representing the next
       record to add and returns the new aggregate value. Finally, the squish
       snippet takes $a representing the final aggregate value so far and
       produces the final answer for the aggregator.
  
       Example(s):
          Track count and sum to produce average:
             ii_agg(<<[0, 0]>>, <<[$a->[0] + 1, $a->[1] + {{ct}}]>>, <<$a->[1] / $a->[0]>>)
  
    for_field(qr/.../, <snippet>)
       Takes a regex and a snippet of code. Creates an aggregator that creates a
       map. Keys in the map correspond to fields chosen by matching the regex
       against the fields from input records. Values in the map are produced by
       aggregators which the snippet must act as a factory for ($f is the field).
  
       Example(s):
          To aggregate the sums of all the fields beginning with "t"
             for_field(qr/^t/, <<sum($f)>>)
  
    for_field(qr/.../, qr/.../, <snippet>)
       Takes two regexes and a snippet of code. Creates an aggregator that
       creates a map. Keys in the map correspond to pairs of fields chosen by
       matching the regexes against the fields from input records. Values in the
       map are produced by aggregators which the snippet must act as a factory
       for ($f1 is the first field, $f2 is the second field).
  
       Example(s):
          To find the covariance of all x-named fields with all y-named fields:
             for_field(qr/^x/, qr/^y/, <<covar($f1, $f2)>>)
  
    map_reduce_agg(<snippet>, <snippet>[, <snippet>])
    map_reduce_aggregator(<snippet>, <snippet>[, <snippet>])
    mr_agg(<snippet>, <snippet>[, <snippet>])
    mr_aggregator(<snippet>, <snippet>[, <snippet>])
       Take a map snippet, a reduce snippet, and an optional squish snippet to
       produce an ad-hoc aggregator based on map reduce. The map snippet takes $r
       representing a record and returns its mapped value. The reduce snippet
       takes $a and $b representing two mapped values and combines them. Finally,
       the squish snippet takes a mapped value $a representing all the records
       and produces the final answer for the aggregator.
  
       Example(s):
          Track count and sum to produce average:
             mr_agg(<<[1, {{ct}}]>>, <<[$a->[0] + $b->[0], $a->[1] + $b->[1]]>>, <<$a->[1] / $a->[0]>>)
  
    rec()
    record()
       A valuation that just returns the entire record.
  
    snip(snip)
       Takes a snippet and returns both the snippet and the snippet as a
       valuation. Used to distinguished snippets from scalars in cases where it
       matters, e.g. min('{{x}}') interprets it is a keyspec when it was meant to
       be a snippet (and then a valuation), min(snip('{{x}}')) does what is
       intended. This is used internally by <<...>> and in fact <<...>> just
       translates to snip('...').
  
    subset_agg(<snippet>, <aggregator>)
    subset_aggregator(<snippet>, <aggregator>)
       Takes a snippate to act as a record predicate and an aggregator and
       produces an aggregator that acts as the provided aggregator as run on the
       filtered view.
  
       Example(s):
           An aggregator that counts the number of records with a time not above 6 seconds:
              subset_agg(<<{{time_ms}} <= 6000>>, ct())
  
    type_agg(obj)
    type_scalar(obj)
    type_val(obj)
       Force the object into a specific type. Can be used to force certain
       upconversions (or avoid them).
  
    valuation(sub { ... })
    val(sub { ... })
       Takes a subref, creates a valuation that represents it. The subref will
       get the record as its first and only argument.
  
       Example(s):
          To get the square of the "x" field:
             val(sub{ $[0]->{x} ** 2 })
  
    xform(<aggregator>, <snippet>)
       Takes an aggregator and a snippet and produces an aggregator the
       represents invoking the snippet on the aggregator's result.
  
       Example(s):
          To take the difference between the first and second time fields of the record collection:
             xform(recs(), <<{{1/time}} - {{0/time}}>>)
  
 Help from: --help-keygroups:
 KEY GROUPS
    SYNTAX: !regex!opt1!opt2... Key groups are a way of specifying multiple
    fields to a recs command with a single argument or function. They are
    generally regexes, and have several options to control what fields they
    match. By default you give a regex, and it will be matched against all first
    level keys of a record to come up with the record list. For instance, in a
    record like this:
  
    { 'zip': 1, 'zap': 2, 'foo': { 'bar': 3 } }
  
    Key group: !z! would get the keys 'zip' and 'zap'
  
    You can have a literal '!' in your regex, just escape it with a \.
  
    Normally, key groups will only match keys whose values are scalars. This can
    be changed with the 'returnrefs' or rr flag.
  
    With the above record !f! would match no fields, but !f!rr would match foo
    (which has a value of a hash ref)
  
    Options on KeyGroups:
       returnrefs, rr  - Return keys that have reference values (default:off)
       full, f         - Regex should match against full keys (recurse fully)
       depth=NUM,d=NUM - Only match keys at NUM depth (regex will match against
                         full keyspec)
       sort, s         - sort keyspecs lexically
  
 Help from: --help-keyspecs:
   KEY SPECS
    A key spec is short way of specifying a field with prefixes or regular
    expressions, it may also be nested into hashes and arrays. Use a '/' to nest
    into a hash and a '#NUM' to index into an array (i.e. #2)
  
    An example is in order, take a record like this:
  
      {"biz":["a","b","c"],"foo":{"bar 1":1},"zap":"blah1"}
      {"biz":["a","b","c"],"foo":{"bar 1":2},"zap":"blah2"}
      {"biz":["a","b","c"],"foo":{"bar 1":3},"zap":"blah3"}
  
    In this case a key spec of 'foo/bar 1' would have the values 1,2, and 3 in
    the respective records.
  
    Similarly, 'biz/#0' would have the value of 'a' for all 3 records
  
    You can also prefix key specs with '@' to engage the fuzzy matching logic
  
    Fuzzy matching works like this in order, first key to match wins
      1. Exact match ( eq )
      2. Prefix match ( m/^/ )
      3. Match anywehre in the key (m//)
  
    So, in the above example '@b/#2', the 'b' portion would expand to 'biz' and 2
    would be the index into the array, so all records would have the value of 'c'
  
    Simiarly, @f/b would have values 1, 2, and 3
  
    You can escape / with a \. For example, if you have a record:
    {"foo/bar":2}
  
    You can address that key with foo\/bar
  
 Help from: --help-more:
 Usage: recs-collate <args> [<files>]
    Take records, grouped togther by --keys, and compute statistics (like
    average, count, sum, concat, etc) within those groups.
  
    For starting with collate, try doing single --key collates with some number
    of aggregators (list available in --list-agrregators)
  
 Arguments:
    --dlaggregator|-A ...                         Specify a domain language
                                                  aggregate. See "Domain Language
                                                  Integration" below.
    --aggregator|-a <aggregators>                 Colon separated list of
                                                  aggregate field specifiers. See
                                                  "Aggregates" section below.
    --mr-agg <name> <map> <reduce> <squish>       Specify a map reduce
                                                  aggregator via 3 snippets,
                                                  similar to mr_agg() from the
                                                  domain language.
    --ii-agg <name> <initial> <combine> <squish>  Specify an inject into
                                                  aggregator via 3 snippets,
                                                  similar to ii_agg() from the
                                                  domain language.
    --incremental                                 Output a record every time an
                                                  input record is added to a
                                                  clump (instead of every time a
                                                  clump is flushed).
    --[no]-bucket                                 With --bucket outputs one
                                                  record per clump, with --no-
                                                  bucket outputs one record for
                                                  each record that went into
                                                  the clump.
    --key|-k <keys>                               Comma separated list of key
                                                  fields. May be a key spec or
                                                  key group
    --dlkey|-K ...                                Specify a domain language key.
                                                  See "Domain Language
                                                  Integration" section in --help-
                                                  more.
    --size|--sz|-n <number>                       Number of running clumps to
                                                  keep.
    --adjacent|-1                                 Only group together adjacent
                                                  records. Avoids spooling
                                                  records into memeory
    --cube                                        See "Cubing" section in --help-
                                                  more.
    --clumper ...                                 Use this clumper to group
                                                  records. May be specified
                                                  multiple times. See --help-
                                                  clumping.
    --dlclumper ...                               Use this domain language
                                                  clumper to group records. May
                                                  be specified multiple times.
                                                  See --help-clumping.
    --list-aggregators|--list                     Bail and output a list of
                                                  aggregators
    --show-aggregator <aggregator>                Bail and output this
                                                  aggregator's detailed usage.
    --list-clumpers                               Bail and output a list of
                                                  clumpers
    --show-clumper <clumper>                      Bail and output this clumper's
                                                  detailed usage.
    --filename-key|fk <keyspec>                   Add a key with the source
                                                  filename (if no filename is
                                                  applicable will put NONE)
  
   Help Options:
       --help-aggregators     List the aggregators
       --help-all             Output all help for this script
       --help                 This help screen
       --help-clumping        Help on clumping; mechanisms to group records
                              across a stream
       --help-domainlanguage  Help on the recs domain language, a [very
                              complicated] way of specifying valuations (which
                              act like keys) or aggregators
       --help-keygroups       Help on keygroups, a way of specifying
                              multiple keys
       --help-keys            Help on keygroups and keyspecs
       --help-keyspecs        Help on keyspecs, a way to index deeply and
                              with regexes
       --help-more            Larger help documentation
  
 Examples:
    Count clumps of adjacent lines with matching x fields.
       recs-collate --adjacent --key x --aggregator count
    Count number of each x field value in the entire file.
       recs-collate --key x --aggregator count
    Finds the maximum latency for each date, hour pair
       recs-collate --key date,hour --aggregator worst_latency=max,latency
    Find the median value of x+y in records
       recs-collate --dlaggregator "m=perc(50,snip(<<{{x}}+{{y}}>>))"
  
 Aggregates:
    Aggregates are specified as [<fieldname>=]<aggregator>[,<arguments>]. The
    default field name is aggregator and arguments joined by underscores. See --list-
    aggregators for a list of available aggregators.
  
    Fieldname maybe a key spec. (i.e. foo/bar=sum,field). Additionally, all key
    name arguments to aggregators maybe be key specs (i.e. foo=max,latency/url),
    but not key groups
  
 Cubing:
    Instead of added one entry for each input record, we add 2 ** (number of key
    fields), with every possible combination of fields replaced with the default
    of "ALL". This is not meant to be used with --adjacent or --size. If our key
    fields were x and y then we'd get output records for {x = 1, y = 2}, {x = 1,
    y = ALL}, {x = ALL, y = 2} and {x = ALL, y = ALL}.
  
 Domain Lanuage Integration:
    The normal mechanism for specifying keys and aggregators allows one to
    concisely instantiate the objects that back them in the platform and is
    certainly the easiest way to use recs. The record stream domain language
    allows the creation of these objects in a programmatic way, with neither the
    syntactic issues of the normal way nor its guiding hand.
  
    The domain language is itself just Perl with a collection of library
    functions for creating platform objects included. Your favorite aggregators
    are all here with constructors matching their normal token. For convenience
    of e.g. last, aggregators are also included with a prefixed underscore.
  
    Below you can find documentation on all the "built in" functions. Most
    aggregators and deaggregators should be present with arguments comparable to
    their normal instantiation arugments, but with keyspec parameters replaced
    with valuations parameters.
  
    Either aggregates or keys may be specified using the recs domain language.
    Both --dlkey and --dlaggregator require an options of the format
    '<name>=<domain language code>'. --dlkey requires the code evaluate as a
    valuation, --dlaggregator requires the code evaluate as an aggregator.
  
    See --help-domainlanguage for a more complete description of its workings and
    a list of available functions.
  
    See the examples below for a more gentle introduction.
  
 Examples:
    Count clumps of adjacent lines with matching x fields.
       recs-collate --adjacent --key x --aggregator count
    Count number of each x field in the entire file.
       recs-collate --key x --aggregator count
    Count number of each x field in the entire file, including an "ALL" line.
       recs-collate --key x --aggregator count --cube
    Produce a cummulative sum of field profit up to each date
       recs-collate --key date --adjacent --incremental --aggregator profit_to_date=sum,profit
    Produce record count for each date, hour pair
       recs-collate --key date,hour --aggregator count
    Finds the maximum latency for each date, hour pair
       recs-collate --key date,hour --aggregator worst_latency=max,latency
    Produce a list of hosts in each datacenter.
       recs-collate --key dc --dlaggregator "hosts=uconcat(', ', 'host')"
    Sum all time fields
       recs-collate --key ... --dlaggregator 'times=for_field(qr/^t/, <<sum($f)>>)'
    Find the median value of x+y in records
       recs-collate --dlaggregator "m=perc(50,snip(<<{{x}}+{{y}}>>))"
    Count people by first three letters of their name
       recs-collate --dlkey "tla=<<substr({{name}},0,3)>>" -a ct
  
 
=head1 SEE ALSO
 
=over
 
=item * See L<App::RecordStream> for an overview of the scripts and the system
 
=item * Run C<recs examples> or see L<App::RecordStream::Manual::Examples> for a set of simple recs examples
 
=item * Run C<recs story> or see L<App::RecordStream::Manual::Story> for a humorous introduction to RecordStream
 
=item * Every command has a C<--help> mode available to print out usage and
examples for the particular command, just like the output above.
 
=back
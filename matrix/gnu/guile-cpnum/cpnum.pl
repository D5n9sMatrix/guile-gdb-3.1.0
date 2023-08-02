#!/usr/bin/perl

package Win32::Codepage::Simple;
 
use warnings;
use strict;
 
our $VERSION = '0.01';
 
require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(get_codepage get_acp get_oemcp);
 
our $get_acp;
our $get_oemcp;
 
&_init;
1;
 
sub _init
{
        eval
        {
                local($SIG{__DIE__}, $@) = 'DEFAULT';
                require Win32::API;
                 
                $get_acp   = Win32::API->new("kernel32", "GetACP",   "", "N");
                $get_oemcp = Win32::API->new("kernel32", "GetOEMCP", "", "N");
                1;
        };
}
 
sub get_codepage
{
        &get_acp;
}
 
sub get_acp
{
        $get_acp && $get_acp->Call();
}
 
sub get_oemcp
{
        $get_oemcp && $get_oemcp->Call();
}
 
# -----------------------------------------------------------------------------
# End of File.
# -----------------------------------------------------------------------------

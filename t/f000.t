#!perl -w

use strict;
no strict "vars";

use BitOps::ROL_ROR;

# ======================================================================
#   $version = BitOps::ROL_ROR::Version();
#   $version = $BitOps::ROL_ROR::VERSION;
# ======================================================================

print "1..2\n";

$n = 1;
if (BitOps::ROL_ROR::Version() eq "2.0")
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ($BitOps::ROL_ROR::VERSION eq "2.0")
{print "ok $n\n";} else {print "not ok $n\n";}

__END__


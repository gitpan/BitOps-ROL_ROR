#!perl -w

use strict;
no strict "vars";

use BitOps::ROL_ROR qw(:all);

# ======================================================================
#   $carry = ROL_short($value);
#   $carry = ROR_short($value);
#   $carry = ASL_short($value,$carry);
#   $carry = LSR_short($value,$carry);
# ======================================================================

print "1..38\n";

$n = 1;
$value = hex("1E");
if (ROL_short($value) == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ($value == hex("3C"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

$value = -1;
if (ROL_short($value) == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ($value != 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

$value = hex("5A");
if (ROR_short($value) == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ($value == hex("2D"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

$value = hex("55");
if (ROR_short($value) == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ($value != 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (LSB_short($value) == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (MSB_short($value) == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

$value = -1;
if (ROR_short($value) == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ($value != 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

$value = hex("1E");
if (ASL_short($value,0) == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ($value == hex("3C"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

$value = hex("1E");
if (ASL_short($value,1) == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ($value == hex("3D"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

$value = -1;
if (ASL_short($value,0) == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ($value != 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (LSB_short($value) == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (MSB_short($value) == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

$value = -1;
if (ASL_short($value,1) == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ($value != 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (LSB_short($value) == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (MSB_short($value) == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

$value = hex("5A");
if (LSR_short($value,0) == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ($value == hex("2D"))
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

$value = hex("55");
if (LSR_short($value,1) == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ($value != 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (LSB_short($value) == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (MSB_short($value) == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

$value = -1;
if (LSR_short($value,0) == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ($value != 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (LSB_short($value) == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (MSB_short($value) == 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

$value = -1;
if (LSR_short($value,1) == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if ($value != 0)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (LSB_short($value) == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;
if (MSB_short($value) == 1)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

__END__


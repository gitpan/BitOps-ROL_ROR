
#  Copyright (c) 1997 by Steffen Beyer. All rights reserved.
#  This package is free software; you can redistribute it
#  and/or modify it under the same terms as Perl itself.

package BitOps::ROL_ROR;

use strict;
use vars qw(@ISA @EXPORT @EXPORT_OK %EXPORT_TAGS $VERSION);

require Exporter;
require DynaLoader;

@ISA = qw(Exporter DynaLoader);

@EXPORT = qw();

@EXPORT_OK = qw( bits_of_byte bits_of_short bits_of_int bits_of_long
LSB_byte MSB_byte LSB_short MSB_short LSB_int MSB_int LSB_long MSB_long
ROL_byte ROR_byte ASL_byte LSR_byte ROL_short ROR_short ASL_short LSR_short
ROL_int ROR_int ASL_int LSR_int ROL_long ROR_long ASL_long LSR_long );

%EXPORT_TAGS = (all => [@EXPORT_OK]);

$VERSION = '2.0';

bootstrap BitOps::ROL_ROR $VERSION;

1;

__END__

=head1 NAME

BitOps::ROL_ROR - Rotate Left, Rotate Right

Implements rotate left, rotate right, arithmetic shift left and
logical shift right operations with carry flag for all C integer types

=head1 SYNOPSIS

=over 4

=item *

C<use BitOps::ROL_ROR qw( bits_of_byte bits_of_short bits_of_int bits_of_long>
C<LSB_byte MSB_byte LSB_short MSB_short LSB_int MSB_int LSB_long MSB_long>
C<ROL_byte ROR_byte ASL_byte LSR_byte ROL_short ROR_short ASL_short LSR_short>
C<ROL_int ROR_int ASL_int LSR_int ROL_long ROR_long ASL_long LSR_long );>

imports all (or some, by leaving some out) of the available operations
and functions

=item *

C<use BitOps::ROL_ROR qw(:all);>

imports all available operations and functions

=item *

C<$version = BitOps::ROL_ROR::Version();>

returns the module's version number

=item *

C<$bits = bits_of_byte();>

returns the number of bits in a byte (unsigned char) on your machine

=item *

C<$bits = bits_of_short();>

returns the number of bits in an unsigned short on your machine

=item *

C<$bits = bits_of_int();>

returns the number of bits in an unsigned int on your machine

=item *

C<$bits = bits_of_long();>

returns the number of bits in an unsigned long on your machine

=item *

C<$lsb = LSB_byte($value);>

returns the least significant bit (LSB) of a byte (unsigned char)

=item *

C<$msb = MSB_byte($value);>

returns the most significant bit (MSB) of a byte (unsigned char)

=item *

C<$lsb = LSB_short($value);>

returns the least significant bit (LSB) of an unsigned short

=item *

C<$msb = MSB_short($value);>

returns the most significant bit (MSB) of an unsigned short

=item *

C<$lsb = LSB_int($value);>

returns the least significant bit (LSB) of an unsigned int

=item *

C<$msb = MSB_int($value);>

returns the most significant bit (MSB) of an unsigned int

=item *

C<$lsb = LSB_long($value);>

returns the least significant bit (LSB) of an unsigned long

=item *

C<$msb = MSB_long($value);>

returns the most significant bit (MSB) of an unsigned long

=item *

C<$carry = ROL_byte($value);>

=item *

C<$carry = ROR_byte($value);>

=item *

C<$carry_out = ASL_byte($value,$carry_in);>

=item *

C<$carry_out = LSR_byte($value,$carry_in);>

=item *

C<$carry = ROL_short($value);>

=item *

C<$carry = ROR_short($value);>

=item *

C<$carry_out = ASL_short($value,$carry_in);>

=item *

C<$carry_out = LSR_short($value,$carry_in);>

=item *

C<$carry = ROL_int($value);>

=item *

C<$carry = ROR_int($value);>

=item *

C<$carry_out = ASL_int($value,$carry_in);>

=item *

C<$carry_out = LSR_int($value,$carry_in);>

=item *

C<$carry = ROL_long($value);>

=item *

C<$carry = ROR_long($value);>

=item *

C<$carry_out = ASL_long($value,$carry_in);>

=item *

C<$carry_out = LSR_long($value,$carry_in);>

=back

B<Note that "$value" must be a variable in the calls of the functions>
B<ROL, ROR, ASL and LSR, and that the contents of this variable are>
B<altered IMPLICITLY by these functions!>

B<Note also that the "carry" input value is always truncated to the least>
B<significant bit, i.e., input values for "carry" must be either 0 or 1!>

B<Finally, note that the return values of the functions LSB, MSB, ROL, ROR,>
B<ASL and LSR are always either 0 or 1!>

=head1 DESCRIPTION

This module implements rotate left, rotate right, arithmetic shift left
and logical shift right operations with carry flag for all C integer types.

The results depend on the number of bits that the integer types unsigned
char, unsigned short, unsigned int and unsigned long have on your machine.

The module automatically determines the number of bits of each integer type
and adjusts its internal constants accordingly.

How the operations work:

=over 4

=item ROL

ROtate Left:

 carry:                           value:

 +---+            +---+---+---+---     ---+---+---+---+
 | 1 |  <---+---  | 1 | 0 | 0 | 1  ...  1 | 0 | 1 | 1 |  <---+
 +---+      |     +---+---+---+---     ---+---+---+---+      |
            |                                                |
            +------------------------------------------------+

=item ROR

ROtate Right:

                        value:                          carry:

        +---+---+---+---     ---+---+---+---+           +---+
 +--->  | 1 | 0 | 0 | 1  ...  1 | 0 | 1 | 1 |  ---+---> | 1 |
 |      +---+---+---+---     ---+---+---+---+     |     +---+
 |                                                |
 +------------------------------------------------+

=item ASL

Arithmetic Shift Left:

 carry                        value:                       carry
  out:                                                      in:
 +---+        +---+---+---+---     ---+---+---+---+        +---+
 | 1 |  <---  | 1 | 0 | 0 | 1  ...  1 | 0 | 1 | 1 |  <---  | 1 |
 +---+        +---+---+---+---     ---+---+---+---+        +---+

=item LSR

Logical Shift Right:

 carry                        value:                       carry
  in:                                                       out:
 +---+        +---+---+---+---     ---+---+---+---+        +---+
 | 1 |  --->  | 1 | 0 | 0 | 1  ...  1 | 0 | 1 | 1 |  --->  | 1 |
 +---+        +---+---+---+---     ---+---+---+---+        +---+

=back

=head1 EXAMPLE

Suppose you want to implement rotate/shift registers in a machine-independent
way.

The only C integer type whose length in bits you can be pretty sure about
is probably a byte, since the C standard only prescribes minimum lengths
for char, short, int and long and that C<sizeof(char)> C<E<lt>=>
C<sizeof(short)> C<E<lt>=> C<sizeof(int)> C<E<lt>=> C<sizeof(long)>.

How to implement a 4-byte shift register and the 4 operations ROL, ROR,
ASL and LSR on it:

First, you need to define 4 byte registers:

  $byte0 = 0;
  $byte1 = 0;
  $byte2 = 0;
  $byte3 = 0;

Then proceed as follows:

=over 4

=item ROL

Rotate left:

  $carry = ASL_byte($byte3, ASL_byte($byte2, ASL_byte($byte1,
           ASL_byte($byte0, MSB_byte($byte3)))));

=item ROR

Rotate right:

  $carry = LSR_byte($byte0, LSR_byte($byte1, LSR_byte($byte2,
           LSR_byte($byte3, LSB_byte($byte0)))));

=item ASL

Arithmetic shift left:

  $carry_out = ASL_byte($byte3, ASL_byte($byte2, ASL_byte($byte1,
               ASL_byte($byte0, $carry_in))));

=item LSR

Logical shift right:

  $carry_out = LSR_byte($byte0, LSR_byte($byte1, LSR_byte($byte2,
               LSR_byte($byte3, $carry_in))));

=back

=head1 SEE ALSO

perl(1), perlsub(1), perlmod(1), perlxs(1), perlxstut(1), perlguts(1).

=head1 VERSION

This man page documents BitOps::ROL_ROR version 2.0.

=head1 AUTHOR

Steffen Beyer <sb@sdm.de>.

=head1 COPYRIGHT

Copyright (c) 1997 by Steffen Beyer. All rights reserved.

=head1 LICENSE AGREEMENT

This package is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.


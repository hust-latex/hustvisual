#!/usr/bin/env perl
# Preformats a TikZ file for better readability.
# Usage: tikz-format.pl input.tikz > output.tikz

use strict;
use warnings;

local $/; # Slurp mode
my $text = <>;

my $indent = ""; # Indentation string

# Remove double newlines
$text =~ s/\n{2,}/\n/g;

# LaTeX3 compatibility
$text =~ s/even odd rule/even~ odd~ rule/g;
$text =~ s/nonzero rule/nonzero~ rule/g;

# Insert newline and indent after \path[...]
$text =~ s/\s*\\path\[(.*?)\]\s*\(([^)]+)\)/\n\n\\path[$1]\n${indent}($2)/g;

# Collapse Bézier segments into one line
$text =~ s/\.\.\s*controls\s*\([^)]+\)\s*and\s*\([^)]+\)\s*\.\.\s*\([^)]+\)/"${indent}" . $&/ge;

# Add newlines before "--" and ".. controls"
$text =~ s/\s*--\s*/\n${indent}-- /g;
$text =~ s/\s*\.\.\s*controls/\n${indent}.. controls/g;

# Add newlines between points
$text =~ s/\)\s*\(/\)\n${indent}\(/g;

# Remove tikzpicture environment
$text =~ s/\\begin\{tikzpicture\}\s*\[(.*?)\]\s*//g;
$text =~ s/\\end\{tikzpicture\}\s*//g;

# Remove \def \globalscale {1.000000}
$text =~ s/\\def\s+\\globalscale\s+\{.*?\}\s*//g;

# Remove leading/trailing whitespace
$text =~ s/^\s+|\s+$//g;

print "$text\n";

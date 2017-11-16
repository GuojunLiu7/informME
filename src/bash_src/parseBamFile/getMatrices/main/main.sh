#!/usr/bin/env bash
#
# informME: An information-theoretic pipeline for WGBS data
# Copyright (C) 2017, Garrett Jenkinson (jenkinson@jhu.edu),
# and Jordi Abante (jabante1@jhu.edu)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software Foundation,
# Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
# or see <http://www.gnu.org/licenses/>.
#

# Remove previous results
rm -rf out

# Process normal
echo "Processing normal..."
seq 5 | xargs -I {X} bash -c '../getMatrices.sh -r ../../fastaToCpg/main -b input/ --tmpdir tmp/ -d out/ -c 1 -t '[10,10]' -q 4 --time_limit 10 --total_part 4 -- toy_normal_pe {X}'

# Process cancer
echo "Processing cancer..."
seq 5 | xargs -I {X} bash -c '../getMatrices.sh -r ../../fastaToCpg/main/ -b input/ --tmpdir tmp/ -d out/ -c 1 -t '[10,10]' -q 4 --time_limit 10 --total_part 4 -- toy_cancer_pe {X}'


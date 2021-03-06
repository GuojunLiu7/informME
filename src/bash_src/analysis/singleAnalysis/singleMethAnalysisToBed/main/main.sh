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

# Reference from fastaToCpg
reference="../../../../parseBamFile/fastaToCpg/main/"
estimation="../../../../modeling/mergeEstimation/main/out/"
analysis="../../../singleAnalysis/mergeSingleMethAnalysis/main/out/"

# Execute command for normal toy
echo "Processing normal..."
../singleMethAnalysisToBed.sh -r "$reference" -a "$analysis" -e "$estimation" -d out --min_chr 1 --max_chr 5 --MC --ESI --MSI toy_normal 1>/dev/null

# Execute command for cancer toy
echo "Processing cancer..."
../singleMethAnalysisToBed.sh -r "$reference" -a "$analysis" -e "$estimation" -d out --min_chr 1 --max_chr 5 --MC --ESI --MSI toy_cancer 1>/dev/null

# Execute command for pooled toy
echo "Processing pooled..."
../singleMethAnalysisToBed.sh -r "$reference" -a "$analysis" -e "$estimation" -d out --min_chr 1 --max_chr 5 --MC --ESI --MSI toy_pooled 1>/dev/null

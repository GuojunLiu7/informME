#!/bin/bash
#
# informME: An information-theoretic pipeline for WGBS data
# Copyright (C) 2017, Garrett Jenkinson (jenkinson@jhu.edu)
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

# MergeSingleMethAnalysis.sh

# last modified 12/09/16

# shell script to run function MergeMethAnalysis.m in MATLAB

# Get inputs
chr_num=$1
phenoName=$2
species=$3
totalProcessors=$4
ESIflag=$5
MCflag=$6
MATLICE=$7

echo "starting command: MergeMethAnalysis(${chr_num},'${phenoName}','species','${species}','totalProcessors',${totalProcessors},'ESIflag',${ESIflag},'MCflag',${MCflag});"

# Run MATLAB command
matlab -nodesktop -singleCompThread -nosplash -nodisplay -c ${MATLICE} -r "try, disp('Job Running');tic;MergeMethAnalysis(${chr_num},'${phenoName}','species','${species}','totalProcessors',${totalProcessors},'ESIflag',${ESIflag},'MCflag',${MCflag});toc, catch, exit(1), end, exit(0);"

# Check if error in MATLAB, otherwise declare success
EXITCODE=$?
if [ $EXITCODE -ne 0 ]
then
   echo "error in MATLAB"
   echo "tic;MergeMethAnalysis(${chr_num},'${phenoName}','species','${species}','totalProcessors',${totalProcessors},'ESIflag',${ESIflag},'MCflag',${MCflag});toc;"
   exit $EXITCODE
fi

echo "command successful:"
echo "tic;MergeMethAnalysis(${chr_num},'${phenoName}','species','${species}','totalProcessors',${totalProcessors},'ESIflag',${ESIflag},'MCflag',${MCflag});toc;"

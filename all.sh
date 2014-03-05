#!/bin/bash

# MathematicaScript fix for OSX.
function ms () {
  REALPATH=$(realpath "${1}") 
  /Applications/Mathematica.app/Contents/MacOS/MathematicaScript -script "${REALPATH}"
}

# Based on https://gist.github.com/1039285
function runc () {
  FILE="${1}"
  shift
  xd=$(dirname "${FILE%.*}");
  x=$(basename "${FILE%.*}.bin");
  #[ ! "$x" -ot "$FILE" ] || \ # Comment out to recompile every time (useful if the file includes more files).
  (rm -f "$x";cc -o "$x" "$FILE") && \
  "$xd/$x" $*
}

function runFile {
  LANGUAGE="${1}"
  COMMAND="${2}"
  PROBLEM_NUMBER="${3}"
  EXTENSION="${4}"

  FILE="${PROBLEM_NUMBER}.${EXTENSION}"
  if [ -e "${FILE}" ]
  then
    echo ""
    echo "[Problem #${PROBLEM_NUMBER} - ${LANGUAGE}]"
    time "${COMMAND}" "${FILE}"
  fi
}

for i in $(seq 1 1000);
do
  runFile "C" "runc" "${i}" "c"
  runFile "Haskell" "runghc" "${i}" "hs"
  runFile "Mathematica" "ms" "${i}" "m"
  runFile "Julia" "julia" "${i}" "jl"
done
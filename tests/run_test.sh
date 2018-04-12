#!/bin/bash
set -e

response=$(curl --write-out %{http_code} --silent --output /dev/null localhost:4180/ping)
expected="200"

echo "Expecting: $expected"
echo "Server says: $response"

if [ "$expected" != "$response" ]; then
  echo "Test failed!"
  exit 1
else
  echo "Test passed!"
  exit 0
fi
# Copyright (c) 2018 IBM Corp.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Usage:
#   1. Install maven on PATH
#   2. Install JDK on PATH
#   3. Run this from the parent directory: ./scripts/buildAndPushtoICP.sh

#!/bin/bash

cd "$(dirname "$0")"
cd ..
mvn clean package
docker build -t mycluster.icp:8500/default/acmeair-mainservice-java .
docker push mycluster.icp:8500/default/acmeair-mainservice-java

cd ../acmeair-authservice-java
mvn clean package
docker build -t mycluster.icp:8500/default/acmeair-authservice-java .
docker push mycluster.icp:8500/default/acmeair-authservice-java

cd ../acmeair-bookingservice-java
mvn clean package
docker build -t mycluster.icp:8500/default/acmeair-bookingservice-java .
docker push mycluster.icp:8500/default/acmeair-bookingservice-java

cd ../acmeair-customerservice-java
mvn clean package
docker build -t mycluster.icp:8500/default/acmeair-customerservice-java .
docker push mycluster.icp:8500/default/acmeair-customerservice-java

cd ../acmeair-flightservice-java
mvn clean package
docker build -t mycluster.icp:8500/default/acmeair-flightservice-java .
docker push mycluster.icp:8500/default/acmeair-flightservice-java

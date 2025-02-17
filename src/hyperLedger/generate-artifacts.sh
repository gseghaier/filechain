# Copyright [2020] [Frantz Darbon, Gilles Seghaier, Johan Tombre, Frédéric Vaz]

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     https://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ==============================================================================

#!/bin/bash

# export PATH=$PWD/bin:$PATH
export FABRIC_CFG_PATH=${PWD}
echo "Genetating certs for ordering service"
./bin/cryptogen generate --config=./crypto-config.yaml

echo "Generate artifacts for channel"
mkdir -p channel-artifacts
./bin/configtxgen -profile OrdererGenesis -outputBlock ./channel-artifacts/genesis.block -channelID testchainid
./bin/configtxgen -profile Channel -outputCreateChannelTx ./channel-artifacts/channel1.tx -channelID channel1

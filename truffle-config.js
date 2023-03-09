// SPDX-License-Identifier: GPL-3.0
require('dotenv').config();

const HDWalletProvider = require('@truffle/hdwallet-provider');

const MNEMONIC = process.env.MNEMONIC;
const API_KEY = process.env.API_KEY

module.exports = {
    networks: {
        mumbai: {
            provider: () => new HDWalletProvider(MNEMONIC, `https://polygon-mumbai.g.alchemy.com/v2/${API_KEY}`),
            network_id: 80001,
            confirmation: 2,
            timeoutBlock: 200,
            skipDryRun: true
        }
    },
    compilers: {
        solc: {
            version: "0.8.13",
        },
    }
};

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {Script, console} from "forge-std/Script.sol";
import {MoodNFT} from "../src/MoodNFT.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNFT) {
        string memory sadSVG = vm.readFile("./img/sad.svg");
        string memory happySVG = vm.readFile("./img/happy.svg");
        vm.startBroadcast();
        MoodNFT moodNft = new MoodNFT(
            svgToTokenURI(sadSVG),
            svgToTokenURI(happySVG)
        );
        vm.stopBroadcast();
        return moodNft;
    
        
    }

    function svgToTokenURI(
        string memory svg
    ) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}

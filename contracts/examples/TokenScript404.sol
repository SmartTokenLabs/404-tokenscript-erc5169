//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {ERC404} from "../ERC404.sol";
import {ERC5169} from "stl-contracts/ERC/ERC5169.sol";

contract TokenScript404 is Ownable, ERC404, ERC5169 {
    using Strings for uint256;
    uint8 constant _decimals = 18;
    uint256 constant _mintSupply = 10000;

    event Set721TransferExempt(address txExempt);

    string private constant __NAME = "TokenScript-404";
    string private constant __SYM = "T404";
    string private _websiteUri;
    string private _contractUri;

    constructor(
        address initialOwner_,
        address initialMintRecipient_
    ) ERC404(__NAME, __SYM, _decimals) Ownable(initialOwner_) {
        // Do not mint the ERC721s to the initial owner, as it's a waste of gas.
        _setERC721TransferExempt(initialMintRecipient_, true);
        _mintERC20(initialMintRecipient_, _mintSupply * units);
        _websiteUri = ""; //your website here
        _contractUri = string(
                abi.encodePacked('{"name":"TokenScript-404","image":"', getBubbleIcon("tan"),'"}'));
    }

    function contractURI() external view returns (string memory) {
        return _contractUri; // link to your contract metadata
    }

    function tokenURI(uint256 id) public override view returns (string memory) {
        uint8 seed = uint8(bytes1(keccak256(abi.encodePacked(id))));
        string memory imageColor;
        string memory color;

        if (seed <= 100) {
            imageColor = "blue";
            color = "Blue";
        } else if (seed <= 150) {
            imageColor = "green";
            color = "Green";
        } else if (seed <= 200) {
            imageColor = "yellow";
            color = "Yellow";
        } else if (seed <= 230) {
            imageColor = "purple";
            color = "Purple";
        } else if (seed <= 248) {
            imageColor = "red";
            color = "Red";
        } else {
            imageColor = "black";
            color = "Black";
        }

        return
            string(
                abi.encodePacked(
                    '{"name": "TokenScript-404 #',
                    Strings.toString(id),
                    '","description":"A collection of ',
                    Strings.toString(_mintSupply),
                    ' 404 Tokens enhanced with TokenScript',
                    '","external_url":"', _websiteUri, '","image":"',
                    getBubbleIcon(imageColor),
                    '","attributes":[{"trait_type":"Color","value":"',
                    color,
                    '"}]}'
                )
            );
    }

    // Simple SVG icon representing the token
    function getBubbleIcon(string memory color) private pure returns (string memory) {
        return string(
                abi.encodePacked(
                    '<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 50 50">',
                    '<circle cx="25" cy="25" r="20" fill="', color, '" />',
                    '<circle cx="35" cy="15" r="5" fill="white" />',
                    '</svg>'
                )
                );
    }

    function setWhitelist(address account_, bool value_) external onlyOwner {
        _setERC721TransferExempt(account_, value_);
    }

    // Treat as ERC721 type, provide ERC20 interface in TokenScript
    function supportsInterface(
        bytes4 interfaceId
    ) public view override(ERC5169, ERC404) returns (bool) {
        return
            ERC5169.supportsInterface(interfaceId) ||
            ERC404.supportsInterface(interfaceId);
    }

    // ERC-5169
    function _authorizeSetScripts(
        string[] memory
    ) internal view override(ERC5169) onlyOwner {}
}

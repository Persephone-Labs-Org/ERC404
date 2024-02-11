// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "./ERC404.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Persephone is ERC404 {
    string public dataURI;
    string public baseTokenURI;

    constructor(
        address _owner
    ) ERC404("Persephone", "PERSE", 18, 9999, _owner) {
        balanceOf[_owner] = 9999 * 10 ** 18;
    }

    function setDataURI(string memory _dataURI) public onlyOwner {
        dataURI = _dataURI;
    }

    function setTokenURI(string memory _tokenURI) public onlyOwner {
        baseTokenURI = _tokenURI;
    }

    function setNameSymbol(
        string memory _name,
        string memory _symbol
    ) public onlyOwner {
        _setNameSymbol(_name, _symbol);
    }

    function tokenURI(uint256 id) public view override returns (string memory) {
        if (bytes(baseTokenURI).length > 0) {
            return string.concat(baseTokenURI, Strings.toString(id));
        } else {
            uint8 seed = uint8(bytes1(keccak256(abi.encodePacked(id))));
            string memory image;
            string memory color;

            if (seed <= 100) {
                image = "1.gif";
                color = "Green";
            } else if (seed <= 12) {
                image = "2.gif";
                color = "Green";
            } else if (seed <= 24) {
                image = "3.gif";
                color = "Green";
            } else if (seed <= 36) {
                image = "4.gif";
                color = "Green";
            } else if (seed <= 48) {
                image = "5.gif";
                color = "Green";
            } else if (seed <= 60) {
                image = "6.gif";
                color = "Green";
            } else if (seed <= 72) {
                image = "7.gif";
                color = "Orange";
            } else if (seed <= 84) {
                image = "8.gif";
                color = "Orange";
            } else if (seed <= 96) {
                image = "9.gif";
                color = "Orange";
            } else if (seed <= 108) {
                image = "10.gif";
                color = "Orange";
            } else if (seed <= 120) {
                image = "11.gif";
                color = "Orange";
            } else if (seed <= 132) {
                image = "12.gif";
                color = "Orange";
            } else if (seed <= 144) {
                image = "13.gif";
                color = "Purple";
            } else if (seed <= 156) {
                image = "14.gif";
                color = "Purple";
            } else if (seed <= 168) {
                image = "15.gif";
                color = "Purple";
            } else if (seed <= 180) {
                image = "16.gif";
                color = "Purple";
            } else if (seed <= 192) {
                image = "17.gif";
                color = "Purple";
            } else if (seed <= 204) {
                image = "18.gif";
                color = "Purple";
            } else if (seed <= 216) {
                image = "19.gif";
                color = "Orange";
            } else if (seed <= 222) {
                image = "20.gif";
                color = "Blue";
            } else if (seed <= 228) {
                image = "21.gif";
                color = "Red";
            } else if (seed <= 234) {
                image = "22.gif";
                color = "Violet";
            } else if (seed <= 240) {
                image = "23.gif";
                color = "Black";
            } else if (seed <= 246) {
                image = "24.gif";
                color = "Purple";
            } else if (seed <= 252) {
                image = "25.gif";
                color = "Orange";
            } else if (seed <= 253) {
                image = "26.gif";
                color = "Blue";
            } else if (seed <= 254) {
                image = "27.gif";
                color = "Green";
            } else if (seed <= 255) {
                image = "28.gif";
                color = "Black";
            }

            string memory jsonPreImage = string.concat(
                string.concat(
                    string.concat('{"name": "Persephone #', Strings.toString(id)),
                    '","description":"A collection of 9,999 Replicants enabled by ERC404, an experimental token standard.","external_url":"https://Persephone.build","image":"'
                ),
                string.concat(dataURI, image)
            );
            string memory jsonPostImage = string.concat(
                '","attributes":[{"trait_type":"Color","value":"',
                color
            );
            string memory jsonPostTraits = '"}]}';

            return
                string.concat(
                    "data:application/json;utf8,",
                    string.concat(
                        string.concat(jsonPreImage, jsonPostImage),
                        jsonPostTraits
                    )
                );
        }
    }

    function getRandomElement() private view returns (string memory color) {
        uint randomHash = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty)));
        uint index = randomHash % colors.length;
        return colors[index];
    }
}

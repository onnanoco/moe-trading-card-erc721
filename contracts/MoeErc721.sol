// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
********************          ********************          ********************
********************          ********************          ******************((
********************          ********************          ***************(((((
********************          ********************          *************(((((((
********************          ********************          **********((((((((((
********************          ********************          ********((((((((((((
********************          ********************          *****(((((((((((((((
********************          ********************          ***(((((((((((((((((
                                                                                
                                                                                
                                                                                
                                                                                
********************          ********************          ((((((((((((((((((((
********************          ******************((          ((((((((((((((((((((
********************          ***************(((((          ((((((((((((((((((((
********************          *************(((((((          ((((((((((((((((((((
********************          **********((((((((((          ((((((((((((((((((((
********************          ********((((((((((((          ((((((((((((((((((((
********************          *****(((((((((((((((          ((((((((((((((((((((
********************          ***(((((((((((((((((          ((((((((((((((((((((
********************                                                            
********************                                                            
********************                                                            
********************                                                            
********************((((((((((((((((((((((((((((((          ((((((((((((((((((((
******************((((((((((((((((((((((((((((((((          ((((((((((((((((((((
***************(((((((((((((((((((((((((((((((((((          ((((((((((((((((((((
*************(((((((((((((((((((((((((((((((((((((          ((((((((((((((((((((
**********((((((((((((((((((((((((((((((((((((((((          ((((((((((((((((((((
********((((((((((((((((((((((((((((((((((((((((((          ((((((((((((((((((((
*****(((((((((((((((((((((((((((((((((((((((((((((          ((((((((((((((((((((
***(((((((((((((((((((((((((((((((((((((((((((((((          ((((((((((((((((((((
 */

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

struct NftInfo {
    bytes4 jsonId;
    string uri;
}

contract MoeErc721 is ERC721 {

    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdTracker;
    uint256 public constant fee = 10**18;
    address public immutable moeErc20Address;

    mapping (uint256 => NftInfo) public nftInfo;
    
    constructor(string memory _name, string memory _symbol, address _moeErc20Address) ERC721(_name, _symbol) {
        moeErc20Address = _moeErc20Address;
    }

    function mint(address _to, bytes4 _jsonId, string memory _uri) public {
        ERC20 moeErc20 = ERC20(moeErc20Address);
        require(moeErc20.balanceOf(msg.sender) >= fee, "MOE: insufficient MOE balance");
        moeErc20.transfer(address(0), fee);
        _mint(_to, _tokenIdTracker.current());
        nftInfo[_tokenIdTracker.current()] = NftInfo(_jsonId, _uri);
        _tokenIdTracker.increment();
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory) {
        _requireMinted(_tokenId);

        return nftInfo[_tokenId].uri;
    }

    function jsonId(uint256 _tokenId) public view returns (bytes4) {
        _requireMinted(_tokenId);

        return nftInfo[_tokenId].jsonId;
    }

}
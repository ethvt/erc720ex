pragma solidity ^0.6.0;



import 'github/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol';
import 'github/OpenZeppelin/openzeppelin-contracts/contracts/access/Ownable.sol';
import 'github/OpenZeppelin/openzeppelin-contracts/contracts/access/AccessControl.sol';

contract CryptoMonster is ERC721, Ownable, AccessControl {

    struct Monster {
        string name;
        uint level;
        uint attackPower;
        uint defencePower;
    }
    
    
    Monster[] public monsters;
    
    constructor () public ERC721("Monster", "MST") {
    }
    
    function createMonster(string memory _name, address _to) public {
        uint id = monsters.length;
        monsters.push(Monster(_name, 1, 100, 100));
        _mint(_to, id);
    }
    
    
    function battle(uint _monsterId, uint _targetId) public {
        
        require(msg.sender == ownerOf(_monsterId));
        
            Monster storage myMonster = monsters[_monsterId];
            Monster storage enemy = monsters[_targetId];
            if (myMonster.attackPower >= enemy.defencePower) {
                myMonster.level += 1;
                myMonster.attackPower += 10;
            } else {
                enemy.level += 1;
                enemy.defencePower += 10;
        }
    } 
}



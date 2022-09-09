pragma solidity > 0.6.1 < 0.7.0;
import "github.com/provable-things/ethereum-api/provableAPI_0.6.sol";

contract ExampleContract is usingProvable {

   event LogConstructorInitiated(string nextStep);
   event LogBioMatchUpdated(string price);
   event LogNewProvableQuery(string description);

   constructor() public payable  {
      provable_setCustomGasPrice(10000000000);
   	emit LogConstructorInitiated("Constructor was initiated. Call 'updatePrice()' to send the Provable Query.");
   }

   function __callback(bytes32 myid, string memory result) public override
   {
   	//if (msg.sender != provable_cbAddress()) revert();
   	ETHUSD = result;
   	emit LogBioMatchUpdated(result);
   }

   function setter(string memory res) public
   {
      ETHUSD = res;
      emit LogPriceUpdated(res);
   }

   fallback() external  payable
    {}

   function updatePrice() public payable {
       	emit LogNewProvableQuery("Provable query was sent, standing by for the answer..");
       	//WORKS provable_query("URL", "json(http://46.101.193.19/api/match).score"); //, '{"bio_a": "QmYSzGzuuM7LuAUiT5NZsAvUTf4UYV8duaaRnrrHbo443j", "bio_b": "QmQF3Qdatsu84SyU6ofGQGfXuYWoaH5LdPdDABEawsYy8G"}',10000000000);
          provable_query("URL", "json(http://46.101.193.19/api/match).score", '{"bio_a": "QmYSzGzuuM7LuAUiT5NZsAvUTf4UYV8duaaRnrrHbo443j", "bio_b": "QmQF3Qdatsu84SyU6ofGQGfXuYWoaH5LdPdDABEawsYy8G"}');
   }
}

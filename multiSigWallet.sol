contract MultiSignatureWallet {

    //Event get fired for each method
    event submitTransaction(address indexed owner, uint indexed txIndex, address indexed to, uint value, bytes data);
    event confirmTransaction(address indexed owner, uint indexed txIndex);
    event executeTransaction(address indexed owner, uint indexed txIndex);
    event revokeTransaction(address indexed owner, uint indexed txIndex);

    //fire this event when ethers get submitted to this contract
    event deposit(address indexed sender, uint amount, uint balance);

    //Data structures: Below are minimum state variable required
    address[] public owners; //list of owners of multisig wallet
    uint public numConfirmationRequired; //minimum no. of confirmation required inorder to execute transaction
    struct Transaction {
        address to;
        uint amount;
        bytes data;
        bool executed;
        mapping(address => bool) isApproved; //tells that specific address has approved this transaction or not. eg.[0x1=>true, 0x2=>true, 0x3=>false]
        uint numConfrimation; //minimum confrimation required for approving this transaction
    } 
    Transaction[] public transactions;
    mapping(address => bool) public isOwner;



    constructor(address[] memory _owners, uint _numOfConfrimation) public{
        require(_owners.length > 0, "Require at least one owner for multisig wallet");
        require(_numOfConfrimation > 0 && _numOfConfrimation <= _owners.length, "Requrie at least 1 confirmation");

        //copy the incoming param to list of owner state variable
        for (uint i= 0; i < _owners.length; i++){
            require(_owners[i] != address(0),"owner's Address should not be zero");
            require(!isOwner[_owners[i]],"Owner is not present");
            isOwner[_owners[i]] = true;
            owners.push(_owners[i]);
        }

        
        numConfirmationRequired = _numOfConfrimation;
    }

    function submitTransaction(){}

    function confirmTransaction(){}

    function executeTransaction() {}

    function revokeTransaction(){}
}
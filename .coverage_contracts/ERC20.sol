// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
function c_0x8c98cb28(bytes32 c__0x8c98cb28) pure {}


import "./IERC20.sol";
import "./extentions/IERC20Metadata.sol";
import "./utils/Context.sol";

/**
 * @dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 * For a generic mechanism see {ERC20PresetMinterPauser}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * We have followed general OpenZeppelin Contracts guidelines: functions revert
 * instead returning `false` on failure. This behavior is nonetheless
 * conventional and does not conflict with the expectations of ERC20
 * applications.
 *
 * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 *
 * Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
 * functions have been added to mitigate the well-known issues around setting
 * allowances. See {IERC20-approve}.
 */
contract ERC20 is Context, IERC20, IERC20Metadata {
function c_0xc7c71535(bytes32 c__0xc7c71535) public pure {}

    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * The default value of {decimals} is 18. To select a different value for
     * {decimals} you should overload it.
     *
     * All two of these values are immutable: they can only be set once during
     * construction.
     */
    constructor(string memory name_, string memory symbol_) {c_0xc7c71535(0xa3881c8939bf99e13c2a4fc912cc5da96dbb1678ea965807932e4242e74663ae); /* function */ 

c_0xc7c71535(0x5fe2da8c79ff1cb560034346b29faa65b54fa3d972e8cf45c06eed2757225518); /* line */ 
        c_0xc7c71535(0x28ff41d2fc5b4d5a349823e0f76a31491141e4cd174af4ca23ae2bf38941d951); /* statement */ 
_name = name_;
c_0xc7c71535(0x48999d2cbac5a28a9838305fffb667ed81b326d93c1adbf040647962d7f1a75f); /* line */ 
        c_0xc7c71535(0x702e0ebf32a5e83b4e37bd20ca0152a76a3d24f74d863e480d17d119d6bcab94); /* statement */ 
_symbol = symbol_;
        //_mint(initialHolder, initialSupply);
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view virtual override returns (string memory) {c_0xc7c71535(0xa69b5d2377a846ced319675dbdcfe08fb8212177e1d46c53d47fc8cb727c34c6); /* function */ 

c_0xc7c71535(0x09bbe142bcfaba152e3efaa244ea7ddb7c0ab457e9bcce8e005c66b753c72584); /* line */ 
        c_0xc7c71535(0x054f2c7eb9de1c9380576675eae9d22d981f82f254e1c8f0b59eadbbf3b273bc); /* statement */ 
return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view virtual override returns (string memory) {c_0xc7c71535(0x136ffd942bd8fa89fd43f93f9706b341c0f9e3e94655b9e9d59a09b813bb01f0); /* function */ 

c_0xc7c71535(0x7269de3e4491e54f7f49e9b7042dbdf68a49a515d59edf39957a527cbec20d7e); /* line */ 
        c_0xc7c71535(0xca42fd13fd896baa94687caf487071254e4de9708c5d1fa5703865aa85a7f9a1); /* statement */ 
return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5.05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless this function is
     * overridden;
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view virtual override returns (uint8) {c_0xc7c71535(0x5e569c1a19049d1b5ae03d5d23f92ef4cb80fa08e1f838f7c9eead1f7ca34b04); /* function */ 

c_0xc7c71535(0x6a9a203ecdfa12c1554c17f2a2fb7ab3197936f76ed39d0212dafefa74f7301b); /* line */ 
        c_0xc7c71535(0xfca682171fc54c651cf0ce920ae618de698641f3fc322029c33e769092e29f2a); /* statement */ 
return 6;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view virtual override returns (uint256) {c_0xc7c71535(0x149d48cb409da47aea2398a5fb3452bf50969c0d3ec749e4db0597e06ed7dd20); /* function */ 

c_0xc7c71535(0x19d0b6aa0a4291bdc24bd79ea68fabd6527b6c8f1d01f45db15f31ae9da07038); /* line */ 
        c_0xc7c71535(0x5446521bb710043f0287ffa91d47fdc49ee83fb8ec6ce98bc6f78c872e35c42f); /* statement */ 
return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view virtual override returns (uint256) {c_0xc7c71535(0x67345141bc937978cb71e21192ad2c73ebfa98489f36e70a510bd84026fdc408); /* function */ 

c_0xc7c71535(0x6b4be532c6cdbec0d0b88f3c778776a7b371f694b32ace28652ce0d4bbe4b18c); /* line */ 
        c_0xc7c71535(0xf05a827a27a4997ec653192ff273f3ff1c22433e9f838f4d44772a498846c059); /* statement */ 
return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {c_0xc7c71535(0x4f281a94d7182deda5b4895c77861a38930279895c91126685297a833aee1cfc); /* function */ 

c_0xc7c71535(0xfbc2912270c8091610e67127863071a5d29335bcc47ed45d1664f0af5eca6460); /* line */ 
        c_0xc7c71535(0x3d8ce21e8e6321dcea855f65985d690718a8b594c187499f8b9dd2fa80be3bb3); /* statement */ 
_transfer(_msgSender(), recipient, amount);
c_0xc7c71535(0x65dac7f4479c073e47360a25610977e100a98b74fd7d05d7ccab61cdc6e4c687); /* line */ 
        c_0xc7c71535(0x817b541ffb46c5df63abfe69787250d0af5fc1da9c55a08b0b7692dec67516e0); /* statement */ 
return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual override returns (uint256) {c_0xc7c71535(0xacdc4e198b0524ebdcc26eaeec783aefcdd56533a620c690f0325d3c1aea1d06); /* function */ 

c_0xc7c71535(0xf9520a231ccaf4c337121771582ed4e7d8050ea5801d79717f879aa25b9a3969); /* line */ 
        c_0xc7c71535(0x5fe8735b45593ff8cb4a0c52261063ebe5a6df97a38432064b6de8b1ad9830cf); /* statement */ 
return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount) public virtual override returns (bool) {c_0xc7c71535(0xfeafbfff6e61041083ae88cb93a8a18856d86fb8b389767d080a809880ed1194); /* function */ 

c_0xc7c71535(0x16895df22524b583889e0fac257b201aada2228194030a5577947fa55a5c5a7d); /* line */ 
        c_0xc7c71535(0xef2a6c9bc0a52cf116d27f0ec0e56cfd3b7a40a23aa2f95c5c55dfdbb8902f76); /* statement */ 
_approve(_msgSender(), spender, amount);
c_0xc7c71535(0x80069251431d942b00446a35256ee8e2f118483fbbb18aec0184663df6b7c82a); /* line */ 
        c_0xc7c71535(0x3113b16e84dc5f1ba79e00e24322b77c4b9ba26f588044addfea705702562209); /* statement */ 
return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20}.
     *
     * Requirements:
     *
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amount`.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {c_0xc7c71535(0x85738b55765013d1a6d1652831c25baee5fd5b83d7ddac9bb11d464ff77f6381); /* function */ 

c_0xc7c71535(0x096c9b8ec327bc7b99394e25eda019c84733054005fbf816babc7e7cb9decaf7); /* line */ 
        c_0xc7c71535(0xa46ab547d624d224203217c5b338131e710d39118d64d70d63362e4c03c6ef20); /* statement */ 
_transfer(sender, recipient, amount);

c_0xc7c71535(0x9bfd4ca3fc6860ff9e07a13109cc1bff6467b79c486bb5adf431cc5d03ed9b7d); /* line */ 
        c_0xc7c71535(0x3ae3907f743bde5263e3b1389ef072b2c864c75108c303d0830f35d47a011293); /* statement */ 
uint256 currentAllowance = _allowances[sender][_msgSender()];
c_0xc7c71535(0x77f6a91fa9097d1fad49c9b635c8f9abe7447381a5bcc67b2451d5cb4ce23174); /* line */ 
        c_0xc7c71535(0xff5a81a0c263411278efa451b8424db0c214e2747c1f8a0bf88a44543b131f49); /* requirePre */ 
c_0xc7c71535(0x0c594dc76eb74f34eb45485e6e51686171abe1063827722403c59355004ef2af); /* statement */ 
require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");c_0xc7c71535(0x82916b940a5e7affe26fdfe4f3436538607a5868fa6d980323960a138d75e876); /* requirePost */ 

c_0xc7c71535(0xae1bc8d4cfccbe4a90ef443d07d81933e23cfb461b74ec764377335f1648c803); /* line */ 
        unchecked {
            _approve(sender, _msgSender(), currentAllowance - amount);
        }

c_0xc7c71535(0x2ef474079c15c6dfc5c71729ead88a36e1f0e745801d08f270288b9a941e9954); /* line */ 
        c_0xc7c71535(0xc9b6b97e4a0e10e81037d2a1c0a8c83e6f029b29f4c976bac0ad1585c3ac8e33); /* statement */ 
return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {c_0xc7c71535(0x1adcac409b4a946f568be413170c50d98dc3d3ea70f907ce4974add80cb31a92); /* function */ 

c_0xc7c71535(0x3ce675dfc37e926487469301641d7b8456ce01d3b9ddd453002b624092071923); /* line */ 
        c_0xc7c71535(0x5785d59c53ec3b381940b2e65d2c7b82b9bb38fd0cc9ae1d8b06b6798e0beae5); /* statement */ 
_approve(_msgSender(), spender, _allowances[_msgSender()][spender] + addedValue);
c_0xc7c71535(0x1303446ecb8ac1998f221e4d81de097dbf5ad9b5b248bbd3ee6d4312031adbd8); /* line */ 
        c_0xc7c71535(0xa446a380117321a5d3216beaf9c35f2ad8fa7b5396554dc232de153a5e8f75a2); /* statement */ 
return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {c_0xc7c71535(0xca60afb1f28d371c8b78a71d93d2b21f8daaf492b19290d33fd97a5104d7f27b); /* function */ 

c_0xc7c71535(0x0ab223f3c121e727f48372c6db3b02b196472d78d15d36537e7af8442d9279bf); /* line */ 
        c_0xc7c71535(0x0f6bd9d7cde5724f804c5069913e4f460000334faf3f5caf95282de65c38b403); /* statement */ 
uint256 currentAllowance = _allowances[_msgSender()][spender];
c_0xc7c71535(0x5643fdbd3bfee64b5324c26058c565a1e3e75211b0a40132dbdeffc61a145753); /* line */ 
        c_0xc7c71535(0x3fa9c1471de46cb82788067734f5b8ceff30f03ae1eb894605ec5598be6493ca); /* requirePre */ 
c_0xc7c71535(0x50a307a9d332d682c8d93c91d0a6c3af09a2a3813c75a5ae46b3a301c1895b58); /* statement */ 
require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");c_0xc7c71535(0x3a42dc329f5ca67761466448c9e4c0a37590045c84a1bbb06ccf846c47dc69d8); /* requirePost */ 

c_0xc7c71535(0xb00775451828b3cb5224b1cce50b243c4b1a8581e867e7d006daa238c6b2cc86); /* line */ 
        unchecked {
            _approve(_msgSender(), spender, currentAllowance - subtractedValue);
        }

c_0xc7c71535(0xbc4b077ec268b71ae6a27a3d3358059a4cb394a027a9d93fedbca87158cfeb45); /* line */ 
        c_0xc7c71535(0x0eb65f41ffe302c4b1d6187361dbeccfe37aca22e14da720e4847b3bc72aa89f); /* statement */ 
return true;
    }

    /**
     * @dev Moves `amount` of tokens from `sender` to `recipient`.
     *
     * This internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual {c_0xc7c71535(0x8a159755239276de4c61c7eb246e6f85103f8b7f0d4e4575a07b9bb42f9689d9); /* function */ 

c_0xc7c71535(0xed8d1268d4291504e8b7d490d3f3b3943081677ba0b0b85b63b4c60bbda7cb98); /* line */ 
        c_0xc7c71535(0xda43640ab27a396810ca8e9344605467401094df7cc7413223363c06cf9e5406); /* requirePre */ 
c_0xc7c71535(0xa63e3ed572d5e963d295f36b4c9d86e11840cc295c9e195b9e747cdb2136e099); /* statement */ 
require(sender != address(0), "ERC20: transfer from the zero address");c_0xc7c71535(0xa830a65dc81217a092462149838964b300329e2f1da6ac6a2a10970c9097e1ba); /* requirePost */ 

c_0xc7c71535(0xb416c70906a118d10e8b06fa1e703366e201ef64c894394f7b5062b9c43f02cd); /* line */ 
        c_0xc7c71535(0x6a6c66ff9540c06d91e04597e1d3895728d883993deda1212b5e3c349fba1772); /* requirePre */ 
c_0xc7c71535(0xfb22b2963b1e75078c2f28a1bf17814c4048295bfbd59e7fa8966a6e60448aa6); /* statement */ 
require(recipient != address(0), "ERC20: transfer to the zero address");c_0xc7c71535(0x7fb42469a396b2dc5bbae5d37efdc5512cd837ee57a7e3799927bcaa78431221); /* requirePost */ 


c_0xc7c71535(0x75c5d4d3f16b82fb1f24a8b16629f91d6aaa0f5588008deb7623da921b0473e2); /* line */ 
        c_0xc7c71535(0x1723924cbdd6f370a61a9593a3ae8b63367ab674a6c2990b72ed1c8cb75dbf24); /* statement */ 
_beforeTokenTransfer(sender, recipient, amount);

c_0xc7c71535(0x12ce2f88ac53aa6183d9707f6f5d757533d161547b999a333d17b29c1b3fe54f); /* line */ 
        c_0xc7c71535(0x00bb7241407d5b7e75b1aaf252a74d4c247e97a7e71f5f83fb7739b9bdb8a7c6); /* statement */ 
uint256 senderBalance = _balances[sender];
c_0xc7c71535(0x6d4645ae9914760246b0eebabbe76c54bf319a41fa1daa5c4a991ed9d87d0623); /* line */ 
        c_0xc7c71535(0x9e1d09bc90ca9867111446919d4c5e05c23ac0d3a6be78ffd7ce64de74492996); /* requirePre */ 
c_0xc7c71535(0x8d5ee5d75ffbca561bb437e5f208e68391c0265cef57fbbc6cf86dd8ecf9278f); /* statement */ 
require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");c_0xc7c71535(0x66acea9523465fe5b20a24408bd66c82b0a1a6aa663dc016305c6ad0cf290cc1); /* requirePost */ 

c_0xc7c71535(0x1589bd21647b83b98723100ad8f2bbc16a34214d4a38fd8f36d6bd247f8dd2d5); /* line */ 
        unchecked {
            _balances[sender] = senderBalance - amount;
        }
c_0xc7c71535(0x713ff66d6c77de54e46169f4e84b335959cdd965c75de20f28e8cafeb8e45192); /* line */ 
        c_0xc7c71535(0xe3f5204ea1679ea02c68f9598bb9fcb7fd43e7845ea9595f2780ecd79bd9889b); /* statement */ 
_balances[recipient] += amount;

c_0xc7c71535(0x441374d9c41494f19cc8abc9e9a1dd8db8d32e4d03890ad17cfac2d3215f3060); /* line */ 
        c_0xc7c71535(0x57f1b6704f12edd4aa205370170c487891399ad524c472544f5f586ef148a01d); /* statement */ 
emit Transfer(sender, recipient, amount);

c_0xc7c71535(0x83188039e1ea322b1e777b89d7aad490b776fe89d920c78b52f4cdfd574bf8b5); /* line */ 
        c_0xc7c71535(0x9fdc62a9346a8af506cac165526a6204a29196230f3eb085cccf89b363dc2fc6); /* statement */ 
_afterTokenTransfer(sender, recipient, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal virtual {c_0xc7c71535(0xae73c0c230e2f6b4c1ec5f7e2dac100a1a4f35f1ff3cb0c8faa6e6148bd54b15); /* function */ 

c_0xc7c71535(0xabfe965b6028243a54778ab982b0f54ac70c03812837a8650763030ac8315041); /* line */ 
        c_0xc7c71535(0x5de54839fc1484ca56171d22caa9c9c1349f3ea9fb80b181354a1d3fb4843e7c); /* requirePre */ 
c_0xc7c71535(0xccd4a7c674a083a0f191dc5f447621244a62d2a03eac162b45aa3436be77e469); /* statement */ 
require(account != address(0), "ERC20: mint to the zero address");c_0xc7c71535(0x4413722028f8c64083ed5e435cf7054222d95e2c024a633646aea1f6bd8d4cdb); /* requirePost */ 


c_0xc7c71535(0x57bfc01cc5131be981fafc4d01bc6f07a3559dd80782b9ba4fb1ef9424bcd58a); /* line */ 
        c_0xc7c71535(0x1eaf189859b092a964021b1df8a9a261981ed81057e681315bf7d324da3064ec); /* statement */ 
_beforeTokenTransfer(address(0), account, amount);

c_0xc7c71535(0xcb88a91e9bcde751842290bdae9b35a8c20d20b61149f04e062433615fc22e88); /* line */ 
        c_0xc7c71535(0xafca49a4228330df757560c3e267ef96138935c654d1438cca249ce3b0d8b20c); /* statement */ 
_totalSupply += amount;
c_0xc7c71535(0xe9805e8e03ca0d8a22427e2296fbc245e717bcbfa30791016333ba0b4bf3f0a8); /* line */ 
        c_0xc7c71535(0xa4d4131c2c85d1304c3aed717f676bc10bd44f8f622d6ec1639e4f5c63a63953); /* statement */ 
_balances[account] += amount;
c_0xc7c71535(0x64c7a65d46512363eb31a55a9db3b29958d2bdce3124fe7dfe41ba791dca5757); /* line */ 
        c_0xc7c71535(0xfbfd13b5c061268047f1076194467c7d751502d666fe57892327a6bdded9ae7f); /* statement */ 
emit Transfer(address(0), account, amount);

c_0xc7c71535(0x0465dfa0f66548849d8f8143a1274776386f6f37e11c273c9950c2fdf6aa14bb); /* line */ 
        c_0xc7c71535(0xf46d1e0b21ecdaa0a4b6488b1edb7732643d9ea4a1e88bc19f39549697fe3092); /* statement */ 
_afterTokenTransfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {c_0xc7c71535(0x7a079956f1e2137ebcf5f27fb2b71643999fd98c5e9544e6890650ee83431616); /* function */ 

c_0xc7c71535(0xde1d8aba539dc69022fb1ef28e35259e90db9809d14fee466d1eaaa996f8f3d0); /* line */ 
        c_0xc7c71535(0x9a60dc769d718a90c799999a0fc3037f429a6a94f93ceef90ba71bf65e1c509e); /* requirePre */ 
c_0xc7c71535(0xb3ed2394d1bcf04f1ae6d0220b5c69e01570f8894b28a38a9751ef65b4694100); /* statement */ 
require(account != address(0), "ERC20: burn from the zero address");c_0xc7c71535(0x3f6760398fb6e38015d675f71c5ea997c89ac7b965ddb00112cb3ac6ebce1b39); /* requirePost */ 


c_0xc7c71535(0xc18624c98419998e434c150496274d0406f94f3ad822c47e0b8c77e85de9baea); /* line */ 
        c_0xc7c71535(0x4eaca8eca1ba531fec18364a4af31e9946969854528a4db4ddb19369e922d445); /* statement */ 
_beforeTokenTransfer(account, address(0), amount);

c_0xc7c71535(0x1531f3d8f7687a1dfd6c2a47f268f333459a78c5ca9072c511b6f7177ad6f9c8); /* line */ 
        c_0xc7c71535(0x8acfd8ee1be39d16d4b00cbfd27bdaeef680f228c4f9f67bc8a36b27db3f2ce8); /* statement */ 
uint256 accountBalance = _balances[account];
c_0xc7c71535(0x278488e95405db8c31f2085cb9cfb073994089c27eb41a96acedaa8044f6ea43); /* line */ 
        c_0xc7c71535(0xf3f02ad33bcbf10700602b71afdb86a092edf5b49359e96033cb636157b08fed); /* requirePre */ 
c_0xc7c71535(0x16f4336baeadbbd6d1b0a8bef6fb7d1fd4e5e8383b425945ec934a686df07be5); /* statement */ 
require(accountBalance >= amount, "ERC20: burn amount exceeds balance");c_0xc7c71535(0x6a04160688d28a25f402250b931be2e5af1d25c16816a81a527e4c939d737316); /* requirePost */ 

c_0xc7c71535(0xbfcf61b0d18aefd9ca97c80c8085b1ab7e719d7eb112debb3c47b8f903bdb257); /* line */ 
        unchecked {
            _balances[account] = accountBalance - amount;
        }
c_0xc7c71535(0x4cc9f676c99a7cb1e6c2a7456ed6157e18985a2c6049535368685211addfd6c8); /* line */ 
        c_0xc7c71535(0xb72ce457425e5d21e914001fa2db242b34560d59c4bc5ce553e8d1e557d42e75); /* statement */ 
_totalSupply -= amount;

c_0xc7c71535(0x0dc27533683647873fe4f5f13952fbb693b64d452d35b06d9caf1669693504d1); /* line */ 
        c_0xc7c71535(0xa56ff52d526810e990f5794dc3ba9e8349b4d258b369668cbae5e47cbbf18c83); /* statement */ 
emit Transfer(account, address(0), amount);

c_0xc7c71535(0x27aea715960b386b04de8b27c4205d5be0eb468bafdae29a97a3e8316686127d); /* line */ 
        c_0xc7c71535(0x9d8013805b59728e19334d874294c460fa4bcea1424ed9a83efd4c894a0f252b); /* statement */ 
_afterTokenTransfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner` s tokens.
     *
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {c_0xc7c71535(0xd33cc899a5be0c93665a53a275720a1a16f3e67e0a67cb4d41697072dd96fc1f); /* function */ 

c_0xc7c71535(0x35dd43411d1973729d696011a02d8f8dc6a755e3a0f17b346b472da4ebbc7663); /* line */ 
        c_0xc7c71535(0x075c1cedc2abfd344603252537e4d97b3a85c33abbd2bb4747fae6d854fa8012); /* requirePre */ 
c_0xc7c71535(0x5952dd8eb53cfdc397d570c16cd6bfddba1fdd71591be7ea3765d94cb50c8e7b); /* statement */ 
require(owner != address(0), "ERC20: approve from the zero address");c_0xc7c71535(0x2fb327b6889dc8ff54ae66f313107e255bea7c5743c2838ccd605ee58201f6a9); /* requirePost */ 

c_0xc7c71535(0x638cfc2808d8248375f32bb79cbe340f05de7f12f3285772caa3b88ab72ebebe); /* line */ 
        c_0xc7c71535(0xf26ddc092d3007e21218dfd6c5c2468860672fea424d6df17360c5c43ee74ee2); /* requirePre */ 
c_0xc7c71535(0xd14fce78e75c700a25dc70954e6053fbfdcb568968f2cd5eec7566dfe1c16b05); /* statement */ 
require(spender != address(0), "ERC20: approve to the zero address");c_0xc7c71535(0x5ef8480f119ec8b4bd1ec15cf912cf4d0539da1ed75930d6a6482accad1459df); /* requirePost */ 


c_0xc7c71535(0xbd66d4a271ce716c2550362a35978502c9c43792c54c08e54ea61edef241e0de); /* line */ 
        c_0xc7c71535(0xc103c1aa87825f0ada270d7f6d528c56d696fc2b22f2a858dd31b54810f355e4); /* statement */ 
_allowances[owner][spender] = amount;
c_0xc7c71535(0x987dba8b5e0312c95c8a500cd35c8fd87750bc65d9bd051770e74f4f13be01c3); /* line */ 
        c_0xc7c71535(0xa8ebdbd5de6772cbb9ad845adc28fa4830eeccace1dd8ec1bbe4e7c42d8573e6); /* statement */ 
emit Approval(owner, spender, amount);
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {c_0xc7c71535(0x78e467b41cb0ae19ae5080f609eb1646bf9cb4f6454678af91b302ade7ee45a3); /* function */ 
}

    /**
     * @dev Hook that is called after any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * has been transferred to `to`.
     * - when `from` is zero, `amount` tokens have been minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens have been burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {c_0xc7c71535(0x740b4008286287d9964cb700563df2555c184074465428a5f9d1238b52de1f37); /* function */ 
}
}

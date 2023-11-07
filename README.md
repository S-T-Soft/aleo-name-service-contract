# Aleo Name Service Contract Documentation

This contract provides a domain name service on the Aleo platform, allowing users to manage, resolve, and set domain names along with associated resolvers. By offering a decentralized domain name system, it enhances the Aleo ecosystem's functionality, allowing for human-readable addresses and enhancing privacy and security.

### Resolvers

Resolvers are a crucial part of this contract, allowing users to set custom domain name resolutions. For instance, users can link their domain names to specific addresses or handles. A user can resolve "btc" to their Bitcoin address or "twitter" to their Twitter handle. This feature enhances user experience, making it easier to link and share blockchain-related information using familiar terms.

#### Third party resolvers
You can set a third party resolver for your domain name.
The third party resolver is a program that contains `ResolverIndex` struct and `resolvers` mapping.
You can check the [resolver_example.leo](https://github.com/S-T-Soft/aleo-name-service-contract/blob/main/resolver_example.leo) for example.
Please note that you need to add `set_resolver` and any other necessary functions to your program.

To use a third party resolver, you need to set the resolver for your domain name.
Call the `set_resolver` function with `category=8243124901069940082u128`(`8243124901069940082u128` means `resolver`) and `content=YOUR PROGRAM NAME` to set the resolver for your domain name.

### Why It Adds Value to the Aleo Ecosystem

The Aleo Name Service (ANS) integrates seamlessly with Aleo's decentralized network. It promotes user-friendliness by translating cryptographic addresses into human-readable names, thus making transactions more transparent and easier to conduct. Furthermore, the system's decentralized nature ensures that control and management of domain names remain in the hands of the users, promoting trust and integrity within the community.


## How to Use

The simplest way to use ANS is through our official website: https://aleonames.id. 
Additionally, you can register domain names via the snarkos command line or through aleo.tools.

**Set Resolvers**: Utilize the `set_resolver()` function to create custom resolutions for specific domain names.

## Structures, Mappings, and Functions
The contract defines several data structures and functions for the name service. Here is a brief overview of the main components:

### Data Structures

1. `Name`: Holds the ASCII bits of a domain name. If the length of the bits is less than 512, zeros are appended at the end. The bits are then split into four parts.
   - `data1`: The first 128 bits of the ASCII domain name
   - `data2`: The next 128 bits of the ASCII domain name
   - `data3`: The next 128 bits of the ASCII domain name
   - `data4`: The last 128 bits of the ASCII domain name
2. `TokenId`: Holds a Name struct and its parent's hash.
3. `NFT`: A record that holds the ANS's owner, data(`TokenId`), and edition(always 0scalar).
4. `ResolverIndex`: Holds a name_hash and its type.
5. `BaseURI`: Includes as many data parts as necessary to encapsulate the URI. Padded with 0s at the end.

### Mappings

1. `names`: Maps a field (name hash) to an TokenId structure.
2. `nft_owners`: Maps a field (name hash) to an Address. Means a public domain.
3. `primary_names`: Maps an address to a primary name.
4. `resolvers`: Maps a ResolverIndex structure to a field(name hash).
5. `general_settings`: Store general settings for the contract.
6. `toggle_settings`: Store toggle settings for the contract.
   - initialized flag = 0b0000...0001 = 1u32
   - minting flag = 0b0000...0010 = 2u32
   - frozen flag = 0b0000...1000 = 8u32

### Main Functions & Transitions

1. `validate_name`: Validates a domain name. Only allow 0-9,a-z,- and _ characters.
2. `register`: Registers a new private domain name. This transaction support register a domain for another receiver.
3. `register_sub`: Registers a new private subdomain. The parent domain must be registered first and must be private domain.
4. `register_sub_public`: Registers a new private subdomain. The parent domain must be a public domain and owned by the caller.
5. `transfer_private`: Transfers the ownership of a private domain name to another address.
6. `transfer_public`: Transfers the ownership of a public domain name to another address.
7. `conver_private_to_public`: Converts a private domain to a public domain.
8. `conver_public_to_private`: Converts a public domain to a private domain.
9. `set_primary_name`: Sets the primary name of an address. The domain must be a public domain and owned by the caller.
10. `unset_primary_name`: Unsets the primary name of an address.
11. `set_resolver`: Sets the resolver for a domain name and category. The domain must be a public domain and owned by the caller.
12. `unset_resolver`: Unsets the resolver for a domain name and category.


## Contributing

Contributions to the AleoNames contract are welcome. Please feel free to submit a pull request or open an issue if you encounter any problems or have suggestions for improvements.

## Author
Discord Username: snowtigersoft